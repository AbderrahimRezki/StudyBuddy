import 'package:equatable/equatable.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';

class CategoryState extends Equatable {
  final List<CategoryEntity>? categories;
  const CategoryState({this.categories});

  @override
  List<Object?> get props => [categories];
}
