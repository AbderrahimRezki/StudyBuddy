import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/categories_repository.dart';

class GetAllCategoriesUseCase extends UseCase<List<CategoryEntity>, void> {
  final CategoriesRepository _categoriesRepository;
  GetAllCategoriesUseCase(this._categoriesRepository);

  @override
  Future<List<CategoryEntity>> call({void params}) async {
    return _categoriesRepository.getAllCategories();
  }
}
