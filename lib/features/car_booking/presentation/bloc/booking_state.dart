import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class BookingState extends Equatable {
  final List<BookingEntity>? bookings;
  final BookingEntity? booking;
  final DioException? error;
  const BookingState({this.bookings, this.error, this.booking});
  @override
  List<Object?> get props => [bookings, error];
}

class BookingsLoading extends BookingState {
  const BookingsLoading();
}

class BookingsFetched extends BookingState {
  const BookingsFetched(List<BookingEntity> bookings)
      : super(bookings: bookings);
}

class BookingsError extends BookingState {
  const BookingsError(DioException error) : super(error: error);
}

class CreatingBooking extends BookingState {
  const CreatingBooking();
}

class CreateBookingError extends BookingState {
  const CreateBookingError(DioException error) : super(error: error);
}

class BookingCreated extends BookingState {
  const BookingCreated(BookingEntity booking) : super(booking: booking);
}
