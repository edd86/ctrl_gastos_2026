import 'package:ctrl_gastos/core/data/db_helper.dart';
import 'package:ctrl_gastos/features/users/data/model/user_model.dart';
import 'package:ctrl_gastos/features/users/domain/entities/user_entity.dart';
import 'package:ctrl_gastos/features/users/domain/repo/user_repo.dart';

class UserRepoImpl implements UserRepo {
  @override
  Future<bool> createUser(UserEntity userEntity) async {
    final userModel = UserModel.fromEntity(userEntity);
    bool isCreated = false;
    try {
      final dbHelper = await DbHelper.instance.database;
      final response = await dbHelper.insert('users', userModel.toJson());
      if (response > 0) {
        isCreated = true;
      }
      return isCreated;
    } catch (e) {
      Exception('Error al crear el usuario: $e');
      return isCreated;
    }
  }
}
