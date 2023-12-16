import "package:sqflite/sqflite.dart";
import 'package:study_buddy/core/database/database_helper.dart';
import 'package:study_buddy/features/task/data/models/category_model.dart';

class CategoryDao {
  static String tableName = "Category";

  static Future<bool> addCategory(CategoryModel category) async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      await database.insert(tableName, category.toJson());
    } catch (e) {
      print("$e");

      return false;
    }
    return true;
  }

  static Future<bool> deleteCategory(CategoryModel category) async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      await database.delete(tableName,
          where: "categoryId = ?", whereArgs: [category.categoryId]);
    } catch (e) {
      print("$e");

      return false;
    }
    return true;
  }

  static Future<List<CategoryModel>> getAllCategories(
      CategoryModel category) async {
    Database database = await DatabaseHelper.getDatabase();

    try {
      var result = await database.rawQuery("SELECT * FROM Category");
      result.map((e) => CategoryModel.fromJson(e));
      return result as List<CategoryModel>;
    } catch (e) {
      print("$e");

      return [];
    }
  }
}
