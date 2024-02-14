import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:car_renatl_app/features/car/domain/repository/car_repository.dart';

class GetSavedCarsUseCase extends UseCase<List<CarEntity>, void> {
  final CarRepository _carRepository;
  GetSavedCarsUseCase(this._carRepository);
  @override
  Future<List<CarEntity>> call({void params}) {
    return _carRepository.getSavedCars();
  }
}
