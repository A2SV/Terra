import 'package:equatable/equatable.dart';
import 'package:mobile/src/core/entities/user_account.dart';

class LoginReturn extends Equatable{
  final UserAccount user;
  final String token;

  const LoginReturn({required this.user, required this.token});
  
  @override
  List<Object?> get props => [user,token];
}