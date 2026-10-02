import 'package:ctrl_gastos/features/home/domain/esntities/dashboard_info.dart';

abstract class HomeRepo {
  Future<DashboardInfo> getDashboardInfo(int userId);
}
