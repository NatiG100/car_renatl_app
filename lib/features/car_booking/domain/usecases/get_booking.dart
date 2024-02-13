import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/repositories/booking_repository.dart';

class GetBookingUseCase extends UseCase<DataState<BookingEntity>, String> {
  final BookingRepository _bookingRepository;
  GetBookingUseCase(this._bookingRepository);
  @override
  Future<DataState<BookingEntity>> call({String? params}) {
    return _bookingRepository.booking(params!);
  }
}
