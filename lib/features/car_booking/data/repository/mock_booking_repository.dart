import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/repositories/booking_repository.dart';

class MockBookingRepository implements BookingRepository {
  List<BookingEntity> remoteBookings = [];
  List<BookingEntity> localBookings = [];
  @override
  Future<DataState<BookingEntity>> booking(String id) {
    var booking = remoteBookings.where((element) => element.id == id).first;
    return Future.delayed(
        const Duration(milliseconds: 500), () => DataSuccess(data: booking));
  }

  @override
  Future<DataState<BookingEntity>> createBooking(BookingEntity booking) {
    return Future.delayed(const Duration(milliseconds: 500), () {
      remoteBookings.add(booking);
      return DataSuccess(data: booking);
    });
  }

  @override
  Future<DataState<List<BookingEntity>>> myBookings() {
    return Future.delayed(const Duration(milliseconds: 500),
        () => DataSuccess(data: remoteBookings));
  }
}
