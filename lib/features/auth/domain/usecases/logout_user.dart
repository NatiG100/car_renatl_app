import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/auth/domain/repository/user_repository.dart';

class LogoutUseCase extends UseCase<DataState<ResponseMessage>, void> {
  final UserRepository _userRepository;
  LogoutUseCase(this._userRepository);
  @override
  Future<DataState<ResponseMessage>> call({void params}) {
    return _userRepository.logout();
  }
}
