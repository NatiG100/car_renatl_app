import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteCarsState extends Equatable {
  final List<CarEntity>? cars;
  final DioException? error;
  const RemoteCarsState({this.cars, this.error});
  @override
  @override
  List<Object?> get props => [cars, error];
}

class RemoteCarsLoading extends RemoteCarsState {
  const RemoteCarsLoading();
}

class RemoteCarsError extends RemoteCarsState {
  const RemoteCarsError(DioException error) : super(error: error);
}

class RemoteCarsFetched extends RemoteCarsState {
  const RemoteCarsFetched(List<CarEntity> cars) : super(cars: cars);
}
