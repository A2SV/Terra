import 'package:mobile/src/core/entities/user_account.dart';

class UserModel extends UserAccount {
  const UserModel(
      {required super.id,
      required super.email,
      required super.firstName,
      required super.lastName,
      super.profilePicture,
      super.token,});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'profilePicture': profilePicture,
      'token': token,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      profilePicture: map['profilePicture'] as String?,
    );
  }

  UserModel copyWith({
  String? id,
  String? email,
  String? firstName,
  String? lastName,
  String? profilePicture,
  String? token,
}) {
  return UserModel(
    id: id ?? this.id,
    email: email ?? this.email,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    profilePicture: profilePicture ?? this.profilePicture,
    token: token ?? this.token,
  );
}
}
