import 'package:study_buddy/features/task/domain/entities/category_entity.dart';

abstract class CategoriesRepository {
  Future<List<CategoryEntity>> getAllCategories();
}
