import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.id,
    this.fullName,
    this.emailAddress,
    this.mobileNumber,
    this.profileImageUrl,
    this.password,
    this.confirmPassword,
    this.isVerified,
  });
  final String? id;
  final String? fullName;
  final String? emailAddress;
  final String? mobileNumber;
  final String? profileImageUrl;
  final String? password;
  final String? confirmPassword;
  final bool? isVerified;

  @override
  List<Object?> get props => [
        fullName,
        emailAddress,
        mobileNumber,
        id,
      ];
}
