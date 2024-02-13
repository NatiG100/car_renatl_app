import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/repositories/booking_repository.dart';

class SaveBookingUseCase
    extends UseCase<DataState<ResponseMessage>, BookingEntity> {
  final BookingRepository _bookingRepository;
  SaveBookingUseCase(this._bookingRepository);

  @override
  Future<DataState<ResponseMessage>> call({BookingEntity? params}) {
    return _bookingRepository.saveBooking(params!);
  }
}
