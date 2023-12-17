import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_buddy/core/database/database_helper.dart';
import 'package:study_buddy/features/task/data/models/category_model.dart';
import 'package:study_buddy/features/task/data/models/task_category_relation.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';

class TaskCategoryDao {
  static String tableName = "TaskCategoryRelation";

  static Future<bool> addTaskCategory(
      TaskCategoryRelation taskCategoryRelation) async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      await database.insert(tableName, taskCategoryRelation.toJson());
    } catch (e) {
      debugPrint("$e");
      return false;
    }
    return true;
  }

  static Future<bool> deleteTaskCategory(TaskCategoryRelation relation) async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      await database
          .delete(tableName, where: "id = ?", whereArgs: [relation.id]);
    } catch (e) {
      debugPrint("$e");
      return false;
    }
    return true;
  }

  static Future<List<CategoryModel>> getAllTaskCategories(
      TaskModel task) async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      var result = await database
          .rawQuery("""SELECT * FROM category INNER JOIN task_category_relation 
        ON category.categoryId = task_category_relation.categoryId 
        WHERE taskId = ? """, [task.taskId]);
      result.map((category) => CategoryModel.fromJson(category));
      return result as List<CategoryModel>;
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }
}
