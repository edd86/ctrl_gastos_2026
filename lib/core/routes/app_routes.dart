import 'package:ctrl_gastos/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String auth = '/auth';

  static Map<String, WidgetBuilder> routes = {
    auth: (context) => const AuthPage(),
  };
}
