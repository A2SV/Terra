import 'package:equatable/equatable.dart';

class UserAccount extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  const UserAccount({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });
  @override
  List<Object?> get props => [id, email, firstName, lastName];
}
