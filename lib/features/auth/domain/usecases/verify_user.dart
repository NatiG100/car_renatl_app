import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/auth/domain/entities/user.dart';
import 'package:car_renatl_app/features/auth/domain/repository/user_repository.dart';

class VerifyUserUseCase extends UseCase<DataState<UserEntity>, String> {
  final UserRepository _userRepository;

  VerifyUserUseCase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({String? params}) {
    return _userRepository.verifyuser(params!);
  }
}
