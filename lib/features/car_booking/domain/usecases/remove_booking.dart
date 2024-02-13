import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car_booking/domain/repositories/booking_repository.dart';

class RemoveBookingUseCase extends UseCase<DataState<ResponseMessage>, String> {
  final BookingRepository _bookingRepository;
  RemoveBookingUseCase(this._bookingRepository);

  @override
  Future<DataState<ResponseMessage>> call({String? params}) {
    return _bookingRepository.removeBooking(params!);
  }
}
