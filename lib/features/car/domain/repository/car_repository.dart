import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car/domain/entities/car.dart';

abstract class CarRepository {
  Future<DataState<List<CarEntity>>> getCars();
  Future<DataState<List<CarEntity>>> getSavedCars();
  Future<DataState<ResponseMessage>> saveCar(CarEntity car);
  Future<DataState<ResponseMessage>> removeCar(String id);
  Future<DataState<ResponseMessage>> removeCars(List<String> ids);
}
