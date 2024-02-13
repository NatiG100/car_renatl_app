import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/repositories/booking_repository.dart';

abstract class CreateBookingUseCase extends UseCase<DataState<BookingEntity>, BookingEntity>{
  final BookingRepository _bookingRepository;
  CreateBookingUseCase(this._bookingRepository);
  
  @override
  Future<DataState<BookingEntity>> call({BookingEntity? params}) {
    return _bookingRepository.createBooking(params!);
  }
  
}