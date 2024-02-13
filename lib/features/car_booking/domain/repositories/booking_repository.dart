import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';

abstract class BookingRepository{
  Future<DataState<BookingEntity>> createBooking(BookingEntity booking);
  Future<DataState<List<BookingEntity>>> myBookings();
  Future<DataState<BookingEntity>> booking(String id);
}