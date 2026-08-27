import 'package:ctrl_gastos/core/data/db_helper.dart';
import 'package:ctrl_gastos/features/auth/domain/entities/auth_info_entity.dart';
import 'package:ctrl_gastos/features/auth/domain/repo/auth_repo.dart';
import 'package:ctrl_gastos/features/users/data/model/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<bool> login(AuthInfoEntity auth) async {
    final dbHelper = await DbHelper.instance.database;
    bool isAuthenticated = false;
    final usersRegistered = await dbHelper.query('users');
    final result = await dbHelper.query(
      'users',
      where: 'email = ?',
      whereArgs: [auth.email],
    );
    if (result.isEmpty) {
      Exception('Usuario no encontrado');
      return isAuthenticated;
    }
    final user = UserModel.fromJson(result.first);
    if (user.password == auth.password) {
      isAuthenticated = true;
    } else {
      Exception('Contraseña incorrecta');
    }
    return isAuthenticated;
  }
}
