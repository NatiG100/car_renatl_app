import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:car_renatl_app/features/car/domain/repository/car_repository.dart';

class MockCarRepository implements CarRepository {
  List<CarEntity> cars = [];
  List<CarEntity> savedCars = [];

  @override
  Future<DataState<List<CarEntity>>> getCars() {
    return Future.delayed(
        const Duration(milliseconds: 500), () => DataSuccess(data: cars));
  }

  @override
  Future<List<CarEntity>> getSavedCars() {
    return Future.delayed(const Duration(milliseconds: 500), () => savedCars);
  }

  @override
  Future<ResponseMessage> removeCar(String id) {
    savedCars.removeWhere((element) => element.id == id);
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => ResponseMessage(
        id: "1",
        message: "successfully removed",
        title: "Success",
      ),
    );
  }

  @override
  Future<ResponseMessage> removeCars(List<String> ids) {
    savedCars.removeWhere((element) => ids.contains(element.id));
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => ResponseMessage(
        id: "1",
        message: "successfully removed",
        title: "Success",
      ),
    );
  }

  @override
  Future<ResponseMessage> saveCar(CarEntity car) {
    savedCars.add(car);
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => ResponseMessage(
        id: "1",
        message: "successfully removed",
        title: "Success",
      ),
    );
  }
}
