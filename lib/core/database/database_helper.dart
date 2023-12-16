import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String createTask = """CREATE TABLE IF NOT EXISTS Task (
  taskId INTEGER PRIMARY KEY AUTOINCREMENT, 
  taskTitle TEXT, 
  taskDescription TEXT, 
  taskDueDate INTEGER, 
  taskPriority INTEGER,
  taskIsDone INTEGER);""";

const String createCategory = """CREATE TABLE IF NOT EXISTS Category (
  categoryId INTEGER PRIMARY KEY AUTOINCREMENT, 
  categoryName TEXT);""";

const String createTaskCategory =
    """CREATE TABLE IF NOT EXISTS TaskCategoryRelation (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  taskId INTEGER, 
  categoryId INTEGER,
              
  FOREIGN KEY (taskId)
    REFERENCES Task(taskId)
  ON UPDATE RESTRICT 
  ON DELETE CASCADE

  FOREIGN KEY (categoryId)
    REFERENCES Category(categoryId)
  ON UPDATE RESTRICT 
  ON DELETE CASCADE);""";

class DatabaseHelper {
  static const _databaseName = "app_database";
  static const _databaseVersion = 4;
  static Future<Database>? database;

  static Future<Database> getDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (database, version) {
        database.execute("$createTask $createCategory $createTaskCategory");
      },
      version: _databaseVersion,
      onUpgrade: (db, oldVersion, newVersion) {},
    );
    return database!;
  }
}
