import 'package:ctrl_gastos/features/auth/domain/entities/auth_info_entity.dart';

class AuthInfoModel {
  final String email;
  final String password;

  AuthInfoModel({required this.email, required this.password});

  factory AuthInfoModel.fromEntity(AuthInfoEntity entity) {
    return AuthInfoModel(email: entity.email, password: entity.password);
  }
}
