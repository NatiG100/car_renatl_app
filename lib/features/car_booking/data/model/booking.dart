import 'package:car_renatl_app/features/car_booking/domain/entities/booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/car/car.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/car/car_feature.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/car/price_deal.dart';

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
    //construct car features
    List<CarFeature>? carFeatures = map["car"]["features"] == null
        ? null
        : (map["car"]["features"] as List)
            .map((e) => CarFeature(
                  id: e["id"],
                  description: e["description"],
                  iconUrl: e["iconUrl"],
                  name: e["name"],
                ))
            .toList();

    //map gallary urls from the json map
    List<String>? gallary = map["car"]["gallary"] == null
        ? null
        : (map["car"]["gallary"] as List).map((e) => e as String).toList();

    //construct price deal
    PriceDeal? priceDeal = map["car"]["priceDeal"] == null
        ? null
        : PriceDeal(
            id: map["car"]["priceDeal"]["id"],
            title: map["car"]["priceDeal"]["title"],
            description: map["car"]["priceDeal"]["description"],
            pricePerDay: map["car"]["priceDeal"]["pricePerDay"],
          );
    return BookingModel(
      id: map['id'] ?? "",
      createdAt: DateTime.parse(map['createdAt']),
      startTrip: DateTime.parse(map['startTrip']),
      endTrip: DateTime.parse(map['endTrip']),
      pickupLocation: map['pickupLocation'] ?? "",
      userId: map['userId'] ?? "",
      car: Car(
        id: map["car"]["id"],
        avgRating: map["car"]["avgRating"],
        brand: map["car"]["brand"],
        description: map["car"]["description"],
        features: carFeatures,
        gallary: gallary,
        imgUrl: map["car"]["imgUrl"],
        location: map["car"]["location"],
        model: map["car"]["model"],
        priceDeal: priceDeal,
        pricePerDay: map["car"]["pricePerDay"],
        totalRatings: map["car"]["totalRatings"],
      ),
    );
  }
}
