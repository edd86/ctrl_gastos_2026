import 'package:ctrl_gastos/features/users/domain/entities/user_entity.dart';

class UserModel {
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  UserModel({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      lastName: entity.lastName,
      email: entity.email,
      phone: entity.phone,
      password: entity.password,
    );
  }
}

/* 
{
  "name": "John",
  "lastName": "Doe",
  "email": "email@email.com",
  "phone": "123456789",
  "password": "password"
}

 */
