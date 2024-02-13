import 'package:car_renatl_app/core/dto/message.dart';
import 'package:car_renatl_app/core/resources/data_state.dart';
import 'package:car_renatl_app/core/usecases/usecase.dart';
import 'package:car_renatl_app/features/car_booking/domain/repositories/booking_repository.dart';

class RemoveBookingsUseCase
    extends UseCase<DataState<ResponseMessage>, List<String>> {
  final BookingRepository _bookingRepository;
  RemoveBookingsUseCase(this._bookingRepository);

  @override
  Future<DataState<ResponseMessage>> call({List<String>? params}) {
    return _bookingRepository.removeBookings(params!);
  }
}
