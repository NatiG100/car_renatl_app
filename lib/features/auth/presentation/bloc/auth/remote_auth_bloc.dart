import 'package:bloc/bloc.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/login.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/logout_user.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/verify_user.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_article_event.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_article_state.dart';
class AuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState>{
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final VerifyUserUseCase _verifyUserUseCase;
  AuthBloc(this._loginUseCase,this._logoutUseCase,this._verifyUserUseCase,):super()
}