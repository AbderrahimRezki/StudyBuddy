import 'package:flutter/material.dart';
import "package:sqflite/sqflite.dart";
import 'package:study_buddy/core/database/database_helper.dart';
import 'package:study_buddy/features/task/data/models/category_model.dart';

class CategoryDao {
  final String tableName = "Category";
  Database? _database;

  CategoryDao() {
    DatabaseHelper.getDatabase().then((database) {
      _database = database;
    });
  }

  Future addCategory(CategoryModel category) async {
    try {
      await _database?.insert(tableName, category.toJson());
    } catch (e) {
      debugPrint("$e");
      return false;
    }
    return true;
  }

  Future deleteCategory(CategoryModel category) async {
    try {
      await _database?.delete(tableName,
          where: "categoryId = ?", whereArgs: [category.categoryId]);
    } catch (e) {
      debugPrint("$e");
      return false;
    }
    return true;
  }

  Future getAllCategories() async {
    try {
      return await _database?.rawQuery("SELECT * FROM $tableName");
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }
}
