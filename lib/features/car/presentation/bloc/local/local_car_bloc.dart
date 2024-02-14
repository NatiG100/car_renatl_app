import 'package:car_renatl_app/features/car/domain/usecases/get_saved_cars.dart';
import 'package:car_renatl_app/features/car/domain/usecases/remove_car.dart';
import 'package:car_renatl_app/features/car/domain/usecases/remove_cars.dart';
import 'package:car_renatl_app/features/car/domain/usecases/save_car.dart';
import 'package:car_renatl_app/features/car/presentation/bloc/local/local_car_event.dart';
import 'package:car_renatl_app/features/car/presentation/bloc/local/local_car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCarsBloc extends Bloc<LocalCarsEvent, LocalCarsState> {
  final GetSavedCarsUseCase _getSavedCarsUseCase;
  final SaveCarUseCase _saveCarUseCase;
  final RemoveCarUseCase _removeCarUseCase;
  final RemoveCarsUseCase _removeCarsUseCase;
  LocalCarsBloc(
    this._getSavedCarsUseCase,
    this._removeCarUseCase,
    this._removeCarsUseCase,
    this._saveCarUseCase,
  ) : super(const LocalCarsLoading()) {
    on<GetSavedCars>(onGetSaveCars);
    on<RemoveCar>(onRemoveCar);
    on<RemoveCars>(onRemoveCars);
    on<SaveCar>(onSaveCar);
  }
  void onGetSaveCars(
    GetSavedCars event,
    Emitter<LocalCarsState> emit,
  ) async {
    emit(const LocalCarsLoading());
    final cars = await _getSavedCarsUseCase();
    emit(LocalCarsDone(cars));
  }

  void onRemoveCar(
    RemoveCar event,
    Emitter<LocalCarsState> emit,
  ) async {
    emit(const LocalCarsLoading());
    await _removeCarUseCase(params: event.id);
    final cars = await _getSavedCarsUseCase();
    emit(LocalCarsDone(cars));
  }

  void onRemoveCars(
    RemoveCars event,
    Emitter<LocalCarsState> emit,
  ) async {
    emit(const LocalCarsLoading());
    await _removeCarsUseCase(params: event.ids);
    final cars = await _getSavedCarsUseCase();
    emit(LocalCarsDone(cars));
  }

  void onSaveCar(
    SaveCar event,
    Emitter<LocalCarsState> emit,
  ) async {
    emit(const LocalCarsLoading());
    await _saveCarUseCase(params: event.car);
    final cars = await _getSavedCarsUseCase();
    emit(LocalCarsDone(cars));
  }
}
