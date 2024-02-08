import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> addUser(UserEntity user);
  Future<DataState<UserEntity>> updateUser(UserEntity user);
  Future<DataState<UserEntity>> verifyuser(String verificationCode);
  Future<DataState<UserEntity>> login(UserEntity user);
  Future<DataState<UserEntity>> me();
  Future<DataState<ResponseMessage>> logout();
}
