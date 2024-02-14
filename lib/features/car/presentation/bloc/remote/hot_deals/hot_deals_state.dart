import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class HotDealsState extends Equatable {
  final List<CarEntity>? hotDeals;
  final DioException? error;
  const HotDealsState({this.hotDeals, this.error});
  @override
  List<Object?> get props => [hotDeals, error];
}

class HotDealsLoading extends HotDealsState {
  const HotDealsLoading();
}

class HotDealsError extends HotDealsState {
  const HotDealsError(DioException error) : super(error: error);
}

class HotDealsDone extends HotDealsState {
  const HotDealsDone(List<CarEntity> hotDeals) : super(hotDeals: hotDeals);
}
