import 'package:equatable/equatable.dart';

class Owner extends Equatable {
  const Owner({
    this.id,
    this.fullName,
    this.address,
    this.phoneNumber,
    this.profileUrl,
  });
  final String? id;
  final String? fullName;
  final String? address;
  final String? phoneNumber;
  final String? profileUrl;

  @override
  List<Object?> get props => [
        id,
        fullName,
        address,
        phoneNumber,
        profileUrl,
      ];
}
