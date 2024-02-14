import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';

abstract class RemoteBookingEvent{
  const RemoteBookingEvent();
}
class CreateBookingEvent extends RemoteBookingEvent{
  final BookingEntity booking;
  CreateBookingEvent(this.booking);
}
class FetchBookingsEvent extends RemoteBookingEvent{
  const FetchBookingsEvent();
}