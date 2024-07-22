import 'package:equatable/equatable.dart';

class UserAccount extends Equatable{
  final String username;
  final String password;

  const UserAccount({
    required this.username,
    required this.password
  });
  @override
  List<Object?> get props => [username, password];

}