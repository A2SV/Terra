import 'package:mobile/src/features/dashboard/domain/domain.dart';

class ListerModel extends Lister {
  const ListerModel({
    required super.id,
    required super.userName,
    required super.normalizedUserName,
    required super.email,
    required super.normalizedEmail,
    required super.emailConfirmed,
    required super.passwordHash,
    required super.securityStamp,
    required super.concurrencyStamp,
    required super.phoneNumber,
    required super.phoneNumberConfirmed,
    required super.twoFactorEnabled,
    required super.lockoutEnd,
    required super.lockoutEnabled,
    required super.accessFailedCount,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.dateOfBirth,
    required super.profilePictureUrl,
    required super.verificationToken,
    required super.passwordResetToken,
    required super.createdAt,
    required super.updatedAt,
  });
  factory ListerModel.fromJson(Map<String, dynamic> json) {
    return ListerModel(
      id: json['id'],
      userName: json['userName'],
      normalizedUserName: json['normalizedUserName'],
      email: json['email'],
      normalizedEmail: json['normalizedEmail'],
      emailConfirmed: json['emailConfirmed'],
      passwordHash: json['passwordHash'],
      securityStamp: json['securityStamp'],
      concurrencyStamp: json['concurrencyStamp'],
      phoneNumber: json['phoneNumber'],
      phoneNumberConfirmed: json['phoneNumberConfirmed'],
      twoFactorEnabled: json['twoFactorEnabled'],
      lockoutEnd: json['lockoutEnd'] != null
          ? DateTime.parse(json['lockoutEnd'])
          : null,
      lockoutEnabled: json['lockoutEnabled'],
      accessFailedCount: json['accessFailedCount'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      profilePictureUrl: json['profilePictureUrl'],
      verificationToken: json['verificationToken'],
      passwordResetToken: json['passwordResetToken'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'normalizedUserName': normalizedUserName,
      'email': email,
      'normalizedEmail': normalizedEmail,
      'emailConfirmed': emailConfirmed,
      'passwordHash': passwordHash,
      'securityStamp': securityStamp,
      'concurrencyStamp': concurrencyStamp,
      'phoneNumber': phoneNumber,
      'phoneNumberConfirmed': phoneNumberConfirmed,
      'twoFactorEnabled': twoFactorEnabled,
      'lockoutEnd': lockoutEnd?.toIso8601String(),
      'lockoutEnabled': lockoutEnabled,
      'accessFailedCount': accessFailedCount,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'profilePictureUrl': profilePictureUrl,
      'verificationToken': verificationToken,
      'passwordResetToken': passwordResetToken,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}