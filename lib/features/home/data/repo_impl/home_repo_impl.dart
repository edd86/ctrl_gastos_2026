import 'package:ctrl_gastos/core/data/db_helper.dart';
import 'package:ctrl_gastos/features/home/domain/esntities/dashboard_info.dart';
import 'package:ctrl_gastos/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<DashboardInfo> getDashboardInfo(int userId) async {
    final dbHelper = await DbHelper.instance.database;

    final responseTotalIncomeAmount = await dbHelper.query(
      'transactions',
      columns: ['SUM(amount) AS totalAmount'],
      where: 'user_id = ? AND type = ?',
      whereArgs: [userId, 'income'],
    );
    final totalIncomAmount =
        responseTotalIncomeAmount.first['totalAmount'] as double? ?? 0.00;

    final responseTotalExpenseAmount = await dbHelper.query(
      'transactions',
      columns: ['SUM(amount) AS totalAmount'],
      where: 'user_id = ? AND type = ?',
      whereArgs: [userId, 'expense'],
    );
    final totalExpenseAmount =
        responseTotalExpenseAmount.first['totalAmount'] as double? ?? 0.00;

    final totalAmount = totalIncomAmount - totalExpenseAmount;

    final monthlyIncomeResponse = await dbHelper.query(
      'transactions',
      columns: ['SUM(amount) AS totalAmount'],
      where:
          'user_id = ? AND type = ? AND strftime("%Y-%m", transactio_date) = strftime("%Y-%m", "now")',
      whereArgs: [userId, 'income'],
    );

    final monthlyExpenseResponse = await dbHelper.query(
      'transactions',
      columns: ['SUM(amount) AS totalAmount'],
      where:
          'user_id = ? AND type = ? AND strftime("%Y-%m", transactio_date) = strftime("%Y-%m", "now")',
      whereArgs: [userId, 'expense'],
    );

    return DashboardInfo(
      totalAmount: totalAmount,
      incomeAmount:
          monthlyIncomeResponse.first['totalAmount'] as double? ?? 0.00,
      expenseAmount:
          monthlyExpenseResponse.first['totalAmount'] as double? ?? 0.00,
    );
  }
}
