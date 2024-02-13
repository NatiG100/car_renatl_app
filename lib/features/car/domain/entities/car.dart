import 'package:car_renatl_app/features/car/domain/entities/car_feature.dart';
import 'package:car_renatl_app/features/car/domain/entities/price_deal.dart';
import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  const CarEntity({
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
}
