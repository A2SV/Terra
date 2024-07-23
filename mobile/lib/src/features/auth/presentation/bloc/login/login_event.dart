
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  @override
  List<Object> get props=>[];
}

class LoginUserEvent extends LoginEvent{
  final String username;
  final String password;

  LoginUserEvent({
    required this.username,
    required this.password
  });

  @override
  List<Object> get props=>[username,password];
}