// ignore_for_file: must_be_immutable

import 'package:study_buddy/features/task/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({super.categoryId, required super.categoryName});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
        categoryId: map['categoryId'], categoryName: map['categoryName']);
  }

  factory CategoryModel.fromEntity(CategoryEntity category) {
    return CategoryModel(
        categoryId: category.categoryId, categoryName: category.categoryName);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"categoryName": categoryName};
    if (categoryId != null) map["categoryId"] = categoryId!;
    return map;
  }
}
