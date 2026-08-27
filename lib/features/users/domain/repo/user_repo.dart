import 'package:ctrl_gastos/features/users/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<bool> createUser(UserEntity userEntity);
}
