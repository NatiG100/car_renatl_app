import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/auth/domain/entities/user.dart';
import 'package:car_renatl_app/features/auth/domain/repository/user_repository.dart';

class WhoAmIUseCase extends UseCase<DataState<UserEntity>, void> {
  final UserRepository _userRepository;

  WhoAmIUseCase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({void params}) {
    return _userRepository.me();
  }
}
