import 'package:sqflite/sqflite.dart';
import 'package:study_buddy/core/database/database_helper.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';

class TaskDao {
  static String tableName = "Task";
  static Future<bool> addTask(TaskModel task) async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      await database.insert(tableName, task.toJson());
    } catch (e) {
      print("$e");
      return false;
    }

    return true;
  }

  static Future<bool> deleteTask(TaskModel task) async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      await database
          .delete(tableName, where: "taskId = ?", whereArgs: [task.taskId]);
    } catch (e) {
      print("$e");

      return false;
    }

    return true;
  }

  static Future<List<TaskModel>> getAllTasks() async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      var result = await database.rawQuery("SELECT * FROM Task");
      result.map((task) => TaskModel.fromJson(task));

      print(result);
      return result as List<TaskModel>;
    } catch (e) {
      print("$e");

      return [];
    }
  }
}
