import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car_booking/domain/usecases/create_booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/usecases/my_bookings.dart';
import 'package:car_renatl_app/features/car_booking/presentation/bloc/booking_event.dart';
import 'package:car_renatl_app/features/car_booking/presentation/bloc/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingBloc extends Bloc<RemoteBookingEvent, BookingState> {
  final CreateBookingUseCase _createBookingUseCase;
  final MyBookingsUseCase _myBookingsUseCase;
  BookingBloc(
    this._createBookingUseCase,
    this._myBookingsUseCase,
  ) : super(const BookingsLoading()) {
    on<CreateBookingEvent>(onBookingCreate);
    on<FetchBookingsEvent>(onFetchBooking);
  }
  void onBookingCreate(
      CreateBookingEvent event, Emitter<BookingState> emit) async {
    emit(const CreatingBooking());
    final dataState = await _createBookingUseCase(params: event.booking);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(BookingCreated(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(CreateBookingError(dataState.error!));
    }
  }

  void onFetchBooking(
      FetchBookingsEvent event, Emitter<BookingState> emit) async {
    emit(const BookingsLoading());
    final dataState = await _myBookingsUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(BookingsFetched(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(BookingsError(dataState.error!));
    }
  }
}
