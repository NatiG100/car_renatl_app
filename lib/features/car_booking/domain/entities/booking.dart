import 'package:car_renatl_app/features/car/domain/entities/car.dart';
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
  final CarEntity? car;
  final String? userId;
  final String? paymentMethod;
  final DateTime? createdAt;

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
