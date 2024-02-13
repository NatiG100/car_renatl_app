import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:car_renatl_app/features/car/domain/repository/car_repository.dart';

class SaveCarUseCase extends UseCase<DataState<ResponseMessage>, CarEntity> {
  final CarRepository _carRepository;
  SaveCarUseCase(this._carRepository);

  @override
  Future<DataState<ResponseMessage>> call({CarEntity? params}) {
    return _carRepository.saveCar(params!);
  }
}
