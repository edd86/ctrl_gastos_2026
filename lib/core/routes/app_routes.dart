import 'package:ctrl_gastos/features/auth/presentation/pages/auth_page.dart';
import 'package:ctrl_gastos/features/home/presentation/pages/home_page.dart';
import 'package:ctrl_gastos/features/users/presentation/pages/user_form.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String auth = '/auth';
  static const String userForm = '/user_form';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    auth: (context) => const AuthPage(),
    userForm: (context) => const UserForm(),
  };
}
