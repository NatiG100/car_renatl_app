import 'package:car_renatl_app/features/car/data/model/car_model.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';

class BookingModel extends BookingEntity {
  const BookingModel({
    super.id,
    super.car,
    super.createdAt,
    super.endTrip,
    super.paymentMethod,
    super.pickupLocation,
    super.startTrip,
    super.userId,
  });

  factory BookingModel.fromJsos(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'] ?? "",
      createdAt: DateTime.parse(map['createdAt']),
      startTrip: DateTime.parse(map['startTrip']),
      endTrip: DateTime.parse(map['endTrip']),
      pickupLocation: map['pickupLocation'] ?? "",
      userId: map['userId'] ?? "",
      car: CarModel.fromJson(map['car']),
    );
  }
}
