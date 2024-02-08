import 'package:car_renatl_app/features/auth/domain/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteAuthState extends Equatable {
  final UserEntity? user;
  final DioException? error;
  const RemoteAuthState({this.user, this.error});

  @override
  List<Object?> get props => [user, error];
}

class RemoteAuthLoading extends RemoteAuthState {
  const RemoteAuthLoading();
}

class RemoteAuthLoggedOut extends RemoteAuthState {
  const RemoteAuthLoggedOut();
}

class RemoteAuthLoggedIn extends RemoteAuthState {
  const RemoteAuthLoggedIn(UserEntity user) : super(user: user);
}

class RemoteAuthInactive extends RemoteAuthState {
  const RemoteAuthInactive(UserEntity user) : super(user: user);
}

class RemoteAuthError extends RemoteAuthState {
  const RemoteAuthError(DioException error) : super(error: error);
}
