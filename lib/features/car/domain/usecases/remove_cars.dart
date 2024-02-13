import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car/domain/repository/car_repository.dart';

class RemoveCarsUseCase
    extends UseCase<DataState<ResponseMessage>, List<String>> {
  final CarRepository _carRepository;
  RemoveCarsUseCase(this._carRepository);

  @override
  Future<DataState<ResponseMessage>> call({List<String>? params}) {
    return _carRepository.removeCars(params!);
  }
}
