import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String createTask = """CREATE TABLE IF NOT EXISTS Task (
taskId INTEGER PRIMARY KEY AUTOINCREMENT, 
taskTitle TEXT, 
taskDescription TEXT, 
taskDueDate INTEGER, 
taskPriority INTEGER,
taskIsDone INTEGER);
""";

const String createCategory = """CREATE TABLE IF NOT EXISTS Category (
categoryId INTEGER PRIMARY KEY AUTOINCREMENT, 
categoryName TEXT);
""";

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
ON DELETE CASCADE);
""";

const String dropCategory = "DROP TABLE IF EXISTS Category;";
const String dropTask = "DROP TABLE IF EXISTS Task;";
const String dropRelation = "DROP TABLE IF EXISTS TaskCategoryRelation;";

const String dropAll = """
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Task;
DROP TABLE IF EXISTS TaskCategoryRelation;
""";

const List<String> categories = [
  "Islamic",
  "IT",
  "Math",
  "Physics",
  "Arabic Literature"
];

class DatabaseHelper {
  static const _databaseName = "app_database";
  static const _databaseVersion = 2;
  static Future<Database>? database;

  static Future<Database> getDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (database, version) async {
        await database.execute(createTask);
        await database.execute(createCategory);
        await database.execute(createTaskCategory);

        for (var category in categories) {
          await database.execute(
              "INSERT INTO Category('categoryName') VALUES(?);", [category]);
        }
      },
      version: _databaseVersion,
      onUpgrade: (database, oldVersion, newVersion) {
        database.execute(
            dropAll + createTask + createCategory + createTaskCategory);
      },
    );
    return database!;
  }
}
