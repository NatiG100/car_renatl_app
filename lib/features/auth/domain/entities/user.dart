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
        id,
        fullName,
        emailAddress,
        mobileNumber,
        profileImageUrl,
        password,
        confirmPassword,
        isVerified,
      ];
  @override
  String toString() {
    return '''
id: $id,
name: $fullName,
email: $emailAddress,
mobileNumber: $mobileNumber,
profileImageUrl: $profileImageUrl,
password: $password,
confirm: $confirmPassword,
isVerified:  $isVerified,
''';
  }
}
