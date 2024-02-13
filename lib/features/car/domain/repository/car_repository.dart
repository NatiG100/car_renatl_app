import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car/domain/entities/car.dart';

abstract class CarRepository {
  Future<DataState<ResponseMessage>> saveCar(CarEntity booking);
  Future<DataState<ResponseMessage>> removeCar(String id);
  Future<DataState<ResponseMessage>> removeCars(List<String> ids);
  Future<DataState<List<CarEntity>>> savedCars();
}
