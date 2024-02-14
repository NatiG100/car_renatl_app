import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:equatable/equatable.dart';

abstract class LocalCarsState extends Equatable {
  final List<CarEntity>? cars;
  const LocalCarsState({this.cars});
  @override
  List<Object?> get props => [cars];
}

class LocalCarsLoading extends LocalCarsState {
  const LocalCarsLoading();
}

class LocalCarsDone extends LocalCarsState {
  const LocalCarsDone(List<CarEntity> cars) : super(cars: cars);
}
