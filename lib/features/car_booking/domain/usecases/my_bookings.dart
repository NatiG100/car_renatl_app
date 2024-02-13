import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/repositories/booking_repository.dart';

class MyBookingsUseCase extends UseCase<DataState<List<BookingEntity>>,void>{
  final BookingRepository _bookingRepository;
  MyBookingsUseCase(this._bookingRepository);
  
  @override
  Future<DataState<List<BookingEntity>>> call({void params}) {
    return _bookingRepository.myBookings();
  }

}