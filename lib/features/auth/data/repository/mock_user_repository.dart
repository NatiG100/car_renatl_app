import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/auth/domain/entities/user.dart';
import 'package:car_renatl_app/features/auth/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';

class MockUserRepository implements UserRepository {
  List<UserEntity> users;
  bool loggedIn;
  UserEntity? loggedInUser;
  MockUserRepository({this.users = const [], this.loggedIn = false});
  @override
  Future<DataState<UserEntity>> addUser(UserEntity user) {
    users.add(user);
    return Future.value(DataSuccess(data: user));
  }

  @override
  Future<DataState<UserEntity>> login(UserEntity user) {
    var filteredUsers =
        users.where((usr) => user.emailAddress == usr.emailAddress).toList();

    if (filteredUsers.isEmpty) {
      return Future.value(
          DataFailed(error: DioException(requestOptions: RequestOptions())));
    }
    var userFound = filteredUsers[0];
    if (userFound.password != user.password) {
      return Future.value(
          DataFailed(error: DioException(requestOptions: RequestOptions())));
    } else {
      loggedIn = true;
      loggedInUser = userFound;
      return Future.value(DataSuccess(data: userFound));
    }
  }

  @override
  Future<DataState<ResponseMessage>> logout() {
    loggedIn = false;
    return Future.value(DataSuccess(
        data: ResponseMessage(
      id: "asdf",
      message: "Successfully logged Out",
      title: "Success",
    )));
  }

  @override
  Future<DataState<UserEntity>> updateUser(UserEntity user) {
    var userFound =
        users.where((usr) => user.emailAddress == usr.emailAddress).toList()[0];
    if (userFound.password != user.password) {
      throw Error();
    } else {
      int userIndex = users.indexOf(userFound);
      return Future.value(DataSuccess(data: users[userIndex]));
    }
  }

  @override
  Future<DataState<UserEntity>> verifyuser(String verificationCode) {
    return Future.value(DataSuccess(data: loggedInUser));
  }

  @override
  Future<DataState<UserEntity>> me() {
    return Future.value(
      DataSuccess(data: loggedInUser),
    );
  }
}
