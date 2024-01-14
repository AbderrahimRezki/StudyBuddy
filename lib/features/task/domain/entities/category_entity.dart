// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  int? categoryId;
  final String categoryName;

  CategoryEntity({this.categoryId, required this.categoryName});

  @override
  List<Object?> get props => [categoryId];
}
