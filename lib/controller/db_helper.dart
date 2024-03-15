import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import '../view/local_page.dart';

class DatabaseHelper {
  static Database? _database;
  static final _tableName = 'tasks';
  static final _columnId = 'id';
  static final _columnTitle = 'title';
  static final _columnIsComplete = 'isComplete';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = path.join(await getDatabasesPath(), 'tasks_database.db');
    return openDatabase(dbPath, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName(
        $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $_columnTitle TEXT,
        $_columnIsComplete INTEGER
      )
    ''');
  }

  Future<int> insertTask(NewTask task) async {
    final db = await database;
    return await db.insert(_tableName, task.toJson());
  }

  Future<List<NewTask>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return NewTask(
        id: maps[i][_columnId],
        title: maps[i][_columnTitle],
        isComplete: maps[i][_columnIsComplete] == 1,
      );
    });
  }
}
