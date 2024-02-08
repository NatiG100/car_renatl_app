import 'package:car_renatl_app/features/auth/domain/entities/user.dart';

abstract class RemoteAuthEvent {
  const RemoteAuthEvent();
}

class LoginEvent extends RemoteAuthEvent {
  LoginEvent(this.user);
  final UserEntity? user;
}

class WhoAmIevent extends RemoteAuthEvent {}

class LogoutEvent extends RemoteAuthEvent {}

class ActivateEvent extends RemoteAuthEvent {
  ActivateEvent(this.verificationCode);
  final String? verificationCode;
}

class UserRegisterEvent extends RemoteAuthEvent {
  UserRegisterEvent(this.user);
  final UserEntity? user;
}

class UserProfileChangedEvent extends RemoteAuthEvent {
  UserProfileChangedEvent(this.user);
  final UserEntity? user;
}
