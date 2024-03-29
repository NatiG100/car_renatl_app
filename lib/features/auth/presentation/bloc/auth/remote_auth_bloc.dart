import 'package:bloc/bloc.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/auth_usecases.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_event.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_state.dart';

class AuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final VerifyUserUseCase _verifyUserUseCase;
  final WhoAmIUseCase _whoAmIUseCase;
  final ChangeUserProfileUseCase _changeUserProfileUseCase;
  final RegisterUserUseCase _registerUserUseCase;
  AuthBloc(
    this._loginUseCase,
    this._logoutUseCase,
    this._verifyUserUseCase,
    this._whoAmIUseCase,
    this._changeUserProfileUseCase,
    this._registerUserUseCase,
  ) : super(const RemoteAuthLoading()) {
    on<WhoAmIevent>(onWhoAmI);
    on<LoginEvent>(onLogIn);
    on<LogoutEvent>(onLogout);
    on<ActivateEvent>(onActivate);
    on<UserProfileChangedEvent>(onUserProfileChange);
    on<UserRegisterEvent>(onUserRegister);
  }
  void onUserRegister(
      UserRegisterEvent event, Emitter<RemoteAuthState> emit) async {
    emit(const RemoteAuthLoading());
    final dataState = await _registerUserUseCase(params: event.user);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteAuthInactive(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteAuthError(dataState.error!));
    }
  }

  void onUserProfileChange(
      UserProfileChangedEvent event, Emitter<RemoteAuthState> emit) async {
    emit(const RemoteAuthLoading());
    final dataState = await _changeUserProfileUseCase(params: event.user);
    if (dataState is DataSuccess && dataState.data != null) {
      switch (dataState.data?.isVerified) {
        case true:
          emit(RemoteAuthLoggedIn(dataState.data!));
          break;
        case false:
          emit(RemoteAuthInactive(dataState.data!));
          break;
        case null:
          break;
      }
    }
    if (dataState is DataFailed) {
      emit(RemoteAuthError(dataState.error!));
    }
  }

  void onWhoAmI(WhoAmIevent event, Emitter<RemoteAuthState> emit) async {
    emit(const RemoteAuthLoading());
    final dataState = await _whoAmIUseCase();
    if (dataState is DataSuccess) {
      switch (dataState.data?.isVerified) {
        case true:
          emit(RemoteAuthLoggedIn(dataState.data!));
          break;
        case false:
          emit(RemoteAuthInactive(dataState.data!));
          break;
        case null:
          emit(const RemoteAuthLoggedOut());
          break;
      }
    }
    if (dataState is DataFailed) {
      emit(RemoteAuthError(dataState.error!));
    }
  }

  void onLogIn(LoginEvent event, Emitter<RemoteAuthState> emit) async {
    emit(const RemoteAuthLoading());
    final dataState = await _loginUseCase(params: event.user);
    if (dataState is DataSuccess && dataState.data != null) {
      switch (dataState.data?.isVerified) {
        case true:
          emit(RemoteAuthLoggedIn(dataState.data!));
          break;
        case false:
          emit(RemoteAuthInactive(dataState.data!));
          break;
        //TODO: the following condition must emit error state
        case null:
          emit(RemoteAuthLoggedIn(dataState.data!));
          break;
      }
    }
    if (dataState is DataFailed) {
      emit(RemoteAuthError(dataState.error!));
    }
  }

  void onLogout(LogoutEvent event, Emitter<RemoteAuthState> emit) async {
    emit(const RemoteAuthLoading());
    final dataState = await _logoutUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(const RemoteAuthLoggedOut());
    }
    if (dataState is DataFailed) {
      emit(RemoteAuthError(dataState.error!));
    }
  }

  void onActivate(ActivateEvent event, Emitter<RemoteAuthState> emit) async {
    emit(const RemoteAuthLoading());
    final dataState = await _verifyUserUseCase(params: event.verificationCode);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteAuthLoggedIn(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteAuthError(dataState.error!));
    }
  }
}
