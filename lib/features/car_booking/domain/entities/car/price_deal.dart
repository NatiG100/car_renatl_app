import 'package:equatable/equatable.dart';

class PriceDeal extends Equatable {
  const PriceDeal({this.id, this.title, this.description, this.pricePerDay});
  final String? id;
  final String? title;
  final String? description;
  final String? pricePerDay;
  @override
  List<Object?> get props => [id, title, description, pricePerDay];

  @override
  String toString() {
    return """"PriceDeal(
  id: $id, 
  title: $title, 
  description: $description, 
  price/day: $pricePerDay
)""";
  }
}
