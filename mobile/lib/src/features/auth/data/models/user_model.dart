import '../../domain/domain.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    String? firstName, 
    String? lastName,  
  }) : super(
        firstName: firstName ?? '',  
        lastName: lastName ?? '',    
      );
}
