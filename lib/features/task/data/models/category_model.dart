import 'package:study_buddy/features/task/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.categoryId, required super.categoryName});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
        categoryId: map['categoryId'], categoryName: map['categoryName']);
  }

  Map<String, dynamic> toJson() {
    return {"categoryId": categoryId, "categoryName": categoryName};
  }
}
