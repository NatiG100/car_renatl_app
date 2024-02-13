import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  const PaymentMethod({this.id, this.name, this.description});
  final String? id;
  final String? name;
  final String? description;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
      ];

  @override
  String toString(){
    return """"PaymentMethod(
  id: $id, 
  name: $name, 
  description: $description, 
)""";
  }
}
