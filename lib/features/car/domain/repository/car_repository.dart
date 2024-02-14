import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car/domain/entities/car.dart';

abstract class CarRepository {
  Future<DataState<List<CarEntity>>> getCars();

  Future<List<CarEntity>> getSavedCars();
  Future<ResponseMessage> saveCar(CarEntity car);
  Future<ResponseMessage> removeCar(String id);
  Future<ResponseMessage> removeCars(List<String> ids);
}
