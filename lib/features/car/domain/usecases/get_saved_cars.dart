import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:car_renatl_app/features/car/domain/repository/car_repository.dart';

class GetSavedCarsUseCase extends UseCase<DataState<List<CarEntity>>, void> {
  final CarRepository _carRepository;
  GetSavedCarsUseCase(this._carRepository);
  @override
  Future<DataState<List<CarEntity>>> call({void params}) {
    return _carRepository.getSavedCars();
  }
}
