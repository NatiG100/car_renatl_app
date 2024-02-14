import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car/domain/repository/car_repository.dart';

class RemoveCarUseCase extends UseCase<ResponseMessage, String> {
  final CarRepository _carRepository;
  RemoveCarUseCase(this._carRepository);

  @override
  Future<ResponseMessage> call({String? params}) {
    return _carRepository.removeCar(params!);
  }
}
