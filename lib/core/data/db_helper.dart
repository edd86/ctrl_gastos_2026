import 'dart:async';
import 'package:ctrl_gastos/core/data/tables.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._internal();

  factory DbHelper() {
    return instance;
  }

  DbHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database?> _initDb() async {
    String path = join(await getDatabasesPath(), 'ctrl_gastos.db');
    final db = await openDatabase(
      path,
      version: 1,
      onConfigure: (db) {
        db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: _onCreate,
    );
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    for (var table in tables) {
      await db.execute(table);
    }
  }
}


//SINGLENTON