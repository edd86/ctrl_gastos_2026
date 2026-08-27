import 'package:ctrl_gastos/features/auth/domain/entities/auth_info_entity.dart';

abstract class AuthRepo {
  Future<bool> login(AuthInfoEntity auth);
}
