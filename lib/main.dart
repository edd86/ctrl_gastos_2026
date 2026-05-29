import 'package:ctrl_gastos/core/data/db_helper.dart';
import 'package:ctrl_gastos/core/theme/ctrl_gastos_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ctrl Gastos',
      theme: CtrlGastosTheme.lightTheme,
      darkTheme: CtrlGastosTheme.darkTheme,
      home: const Scaffold(body: Center(child: Text('Controla tus gastos'))),
    );
  }
}
