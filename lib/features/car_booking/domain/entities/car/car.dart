import 'package:car_renatl_app/features/car_booking/domain/entities/car/car_feature.dart';
import 'package:car_renatl_app/features/car_booking/domain/entities/car/price_deal.dart';
import 'package:equatable/equatable.dart';

class Car extends Equatable {
  const Car({
    this.id,
    this.brand,
    this.model,
    this.avgRating,
    this.totalRatings,
    this.features,
    this.description,
    this.location,
    this.priceDeal,
    this.pricePerDay,
    this.gallary,
    this.imgUrl,
  });
  final String? id;
  final String? brand;
  final String? model;
  final String? description;
  final List<CarFeature>? features;
  final int? avgRating;
  final int? totalRatings;
  final String? location;
  final double? pricePerDay;
  final PriceDeal? priceDeal;
  final String? imgUrl;
  final List<String>? gallary;

  @override
  List<Object?> get props => [
        id,
        brand,
        model,
        description,
        features,
        avgRating,
        totalRatings,
        location,
        priceDeal,
        priceDeal,
      ];

  @override
  String toString() {
    return """"Car(
  id: $id,
  average rating: $avgRating,
  total ratings: $totalRatings,
  brand: $brand,
  description: $description,
  features: $features,
  gallary: $gallary,
  imgUrl: $imgUrl,
  location: $location,
  model: $model,
  price deal: $priceDeal,
  price / day$pricePerDay,
)""";
  }
}
