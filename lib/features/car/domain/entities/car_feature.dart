import 'package:equatable/equatable.dart';

class CarFeature extends Equatable {
  const CarFeature({
    this.id,
    this.name,
    this.description,
    this.iconUrl,
  });
  final String? id;
  final String? name;
  final String? description;
  final String? iconUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        iconUrl,
      ];

  @override
  String toString() {
    return """"CarFeature(
  id: $id, 
  name: $name, 
  description: $description, 
  iconUrl: $iconUrl
)""";
  }
}
