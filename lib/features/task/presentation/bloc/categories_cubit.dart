import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/domain/usecases/get_all_categories.dart';
import 'package:study_buddy/features/task/presentation/bloc/categories_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  CategoryCubit(this._getAllCategoriesUseCase) : super(const CategoryState());

  void getAllCategories() async {
    List<CategoryEntity> categories = await _getAllCategoriesUseCase();
    emit(CategoryState(categories: categories));
  }
}
