import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/auth/domain/entities/user.dart';
import 'package:car_renatl_app/features/auth/domain/repository/user_repository.dart';

class RegisterUserUseCase
    implements UseCase<DataState<UserEntity>, UserEntity> {
  final UserRepository _userRepository;
  RegisterUserUseCase(this._userRepository);
  @override
  Future<DataState<UserEntity>> call({UserEntity? params}) {
    return _userRepository.addUser(params!);
  }
}
