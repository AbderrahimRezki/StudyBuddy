import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_buddy/core/database/database_helper.dart';
import 'package:study_buddy/features/task/data/models/category_model.dart';
import 'package:study_buddy/features/task/data/models/task_category_relation.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';

class TaskCategoryDao {
  final String tableName = "TaskCategoryRelation";
  Database? database;

  TaskCategoryDao() {
    DatabaseHelper.getDatabase().then((db) {
      database = db;
    });
  }

  Future addTaskCategory(TaskCategoryRelation taskCategoryRelation) async {
    try {
      await database!.insert(tableName, taskCategoryRelation.toJson());
    } catch (e) {
      debugPrint("$e");
      return false;
    }
    return true;
  }

  Future deleteTaskCategory(TaskCategoryRelation relation) async {
    try {
      await database!.delete(tableName,
          where: "taskId = ? AND categoryId = ?",
          whereArgs: [relation.taskId, relation.categoryId]);
    } catch (e) {
      debugPrint("$e");
      return false;
    }
    return true;
  }

  Future deleteTaskCategories(int taskId) async {
    try {
      await database!
          .delete(tableName, where: "taskId = ?", whereArgs: [taskId]);
    } catch (e) {
      debugPrint("$e");
      return false;
    }
    return true;
  }

  Future getAllTaskCategories(TaskModel task) async {
    try {
      var result = await database!
          .rawQuery("""SELECT * FROM category INNER JOIN $tableName 
        ON category.categoryId = $tableName.categoryId 
        WHERE taskId = ? """, [task.taskId]);
      result.map((category) => CategoryModel.fromJson(category));
      return result;
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }
}
