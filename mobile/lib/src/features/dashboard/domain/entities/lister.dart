import 'package:equatable/equatable.dart';

class Lister extends Equatable {
  final String id;
  final String userName;
  final String normalizedUserName;
  final String email;
  final String normalizedEmail;
  final bool emailConfirmed;
  final String passwordHash;
  final String securityStamp;
  final String concurrencyStamp;
  final String? phoneNumber;
  final bool phoneNumberConfirmed;
  final bool twoFactorEnabled;
  final DateTime? lockoutEnd;
  final bool lockoutEnabled;
  final int accessFailedCount;
  final String firstName;
  final String lastName;
  final String? gender;
  final DateTime dateOfBirth;
  final String? profilePictureUrl;
  final String? verificationToken;
  final String? passwordResetToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isVerified;

  const Lister({
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
    required this.passwordHash,
    required this.securityStamp,
    required this.concurrencyStamp,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.twoFactorEnabled,
    this.lockoutEnd,
    required this.lockoutEnabled,
    required this.accessFailedCount,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateOfBirth,
    required this.profilePictureUrl,
    required this.verificationToken,
    required this.passwordResetToken,
    required this.createdAt,
    required this.updatedAt,
    required this.isVerified,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        normalizedUserName,
        email,
        normalizedEmail,
        emailConfirmed,
        passwordHash,
        securityStamp,
        concurrencyStamp,
        phoneNumber,
        phoneNumberConfirmed,
        twoFactorEnabled,
        lockoutEnd,
        lockoutEnabled,
        accessFailedCount,
        firstName,
        lastName,
        gender,
        dateOfBirth,
        profilePictureUrl,
        verificationToken,
        passwordResetToken,
        createdAt,
        updatedAt,
        isVerified,
      ];
}
