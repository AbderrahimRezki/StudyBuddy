import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_buddy/core/database/database_helper.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/task_category_dao.dart';
import 'package:study_buddy/features/task/data/models/task_category_relation.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';

class TaskDao {
  final String _tableName = "Task";
  Database? _database;

  TaskDao() {
    DatabaseHelper.getDatabase().then((database) {
      _database = database;
    });
  }

  Future<bool> addTask(TaskModel task) async {
    try {
      final taskId = await _database!.insert(_tableName, task.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      task.taskCategories ??= [];
      for (CategoryEntity category in task.taskCategories!) {
        final relation = TaskCategoryRelation(
            taskId: taskId, categoryId: category.categoryId!);
        await locator<TaskCategoryDao>().addTaskCategory(relation);
      }
      return true;
    } catch (e) {
      debugPrint("$e");
      return false;
    }
  }

  Future<bool> deleteTask(TaskModel task) async {
    try {
      await _database!
          .delete(_tableName, where: "taskId = ?", whereArgs: [task.taskId]);
      return true;
    } catch (e) {
      debugPrint("$e");
      return false;
    }
  }

  Future getAllTasks() async {
    try {
      var result = await _database!.rawQuery("SELECT * FROM Task");
      return result;
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }

  Future<bool> updateTask(TaskModel taskModel) async {
    try {
      await _database!.update(_tableName, taskModel.toJson(),
          where: "taskId = ?", whereArgs: [taskModel.taskId]);
      return true;
    } catch (e) {
      debugPrint("$e");
      return false;
    }
  }

  Future getPendingTasks() async {
    try {
      return await _database!
          .rawQuery("SELECT * FROM Task WHERE taskIsDone = 0");
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }
}
