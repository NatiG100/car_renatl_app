import 'package:car_renatl_app/features/car/domain/entities/car.dart';
import 'package:car_renatl_app/features/car/domain/entities/car_feature.dart';
import 'package:car_renatl_app/features/car/domain/entities/price_deal.dart';

class CarModel extends CarEntity{
  const CarModel({
    super.id,
    super.avgRating,
    super.brand,
    super.description,
    super.features,
    super.gallary,
    super.imgUrl,
    super.location,
    super.model,
    super.priceDeal,
    super.pricePerDay,
    super.totalRatings,
  });

  factory CarModel.fromJson(Map<String, dynamic> map){
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
    return CarModel(
      id: map["id"],
      avgRating: map["avgRating"],
      brand: map["brand"],
      description: map["description"],
      features:carFeatures,
      gallary: gallary,
      imgUrl: map["imgUrl"],
      model: map["model"],
      priceDeal: priceDeal,
      pricePerDay: map["pricePerDay"],
      location: map["location"],
    );
  }
}