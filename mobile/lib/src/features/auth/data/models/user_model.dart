import 'package:mobile/src/core/entities/user_account.dart';

class UserModel extends UserAccount {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
    );
  }
}
