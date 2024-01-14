import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/category_dao.dart';
import 'package:study_buddy/features/task/data/models/category_model.dart';
import 'package:study_buddy/features/task/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    var result = await locator<CategoryDao>().getAllCategories();
    final List<CategoryModel> categories = [];

    for (var category in result) {
      categories.add(CategoryModel.fromJson(category));
    }

    return categories;
  }
}
