import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:equatable/equatable.dart';

abstract class LocalCarsEvent extends Equatable {
  final CarEntity? car;
  const LocalCarsEvent({this.car});
  @override
  List<Object> get props => [car!];
}

class GetSavedCars extends LocalCarsEvent {
  const GetSavedCars();
}

class RemoveCar extends LocalCarsEvent {
  final String id;
  const RemoveCar(this.id);
}

class RemoveCars extends LocalCarsEvent {
  final List<String> ids;
  const RemoveCars(this.ids);
}

class SaveCar extends LocalCarsEvent {
  const SaveCar(CarEntity car) : super(car: car);
}
