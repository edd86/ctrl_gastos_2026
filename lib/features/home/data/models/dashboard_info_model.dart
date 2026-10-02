import 'package:ctrl_gastos/features/home/domain/esntities/dashboard_info.dart';

class DashboardInfoModel {
  final double totalAmount;
  final double incomeAmount;
  final double expenseAmount;

  DashboardInfoModel({
    required this.totalAmount,
    required this.incomeAmount,
    required this.expenseAmount,
  });

  DashboardInfo toEntity() {
    return DashboardInfo(
      totalAmount: totalAmount,
      incomeAmount: incomeAmount,
      expenseAmount: expenseAmount,
    );
  }
}

/* 
  {
    "id": 1,
    "name: "Edward",
    "last_name": "Cruz",
    "email": "ecdv55@hotmail.com",
    "phone": "123456789",
  }


  id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone TEXT UNIQUE,
    password TEXT NOT NULL
 */
