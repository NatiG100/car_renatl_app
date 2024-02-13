import 'package:car_renatl_app/features/car_booking/domain/entities/car/car.dart';
import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  const BookingEntity({
    this.id,
    this.pickupLocation,
    this.startTrip,
    this.endTrip,
    this.car,
    this.userId,
    this.createdAt,
    this.paymentMethod,
  });
  final String? id;
  final String? pickupLocation;
  final DateTime? startTrip;
  final DateTime? endTrip;
  final Car? car;
  final String? userId;
  final String? paymentMethod;
  final String? createdAt;

  @override
  List<Object?> get props => [
        id,
        pickupLocation,
        startTrip,
        endTrip,
        car,
        userId,
        createdAt,
        paymentMethod,
      ];
}
