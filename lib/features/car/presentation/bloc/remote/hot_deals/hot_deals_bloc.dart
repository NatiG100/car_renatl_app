import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car/domain/usecases/hot_deals.dart';
import 'package:car_renatl_app/features/car/presentation/bloc/remote/hot_deals/hot_deals_event.dart';
import 'package:car_renatl_app/features/car/presentation/bloc/remote/hot_deals/hot_deals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotDealsBloc extends Bloc<FetchHotDealsEvent, HotDealsState> {
  final HotDealsUseCase _hotDealsUseCase;
  HotDealsBloc(this._hotDealsUseCase) : super(const HotDealsLoading()) {
    on<FetchHotDealsEvent>(onFetchHotDeals);
  }

  void onFetchHotDeals(
    FetchHotDealsEvent event,
    Emitter<HotDealsState> emit,
  ) async {
    emit(const HotDealsLoading());
    final dataState = await _hotDealsUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(HotDealsDone(dataState.data!));
    }
    if (dataState is DataFailed && dataState.data != null) {
      emit(HotDealsError(dataState.error!));
    }
  }
}
