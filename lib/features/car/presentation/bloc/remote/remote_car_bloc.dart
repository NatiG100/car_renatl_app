import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car/domain/usecases/get_cars.dart';
import 'package:car_renatl_app/features/car/presentation/bloc/remote/remote_car_event.dart';
import 'package:car_renatl_app/features/car/presentation/bloc/remote/remote_car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCarsBloc extends Bloc<RemoteCarsEvent, RemoteCarsState> {
  final GetCarsUseCase _getCarsUseCase;
  RemoteCarsBloc(this._getCarsUseCase) : super(const RemoteCarsLoading()) {
    on<FetchRemtoeCarsEvent>(onFetchRemoteCars);
  }

  void onFetchRemoteCars(
    FetchRemtoeCarsEvent event,
    Emitter<RemoteCarsState> emit,
  ) async {
    emit(const RemoteCarsLoading());
    final dataState = await _getCarsUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteCarsFetched(dataState.data!));
    }
    if (dataState is DataFailed && dataState.data != null) {
      emit(RemoteCarsError(dataState.error!));
    }
  }
}
