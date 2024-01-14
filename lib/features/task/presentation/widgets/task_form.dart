import 'package:flutter/material.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/presentation/widgets/action_buttons.dart';
import 'package:study_buddy/features/task/presentation/widgets/category_section.dart';
import 'package:study_buddy/features/task/presentation/widgets/task_section.dart';

class TaskForm extends StatelessWidget {
  final TaskEntity? task;
  final List<CategoryEntity> categories;
  final Map<CategoryEntity, bool> selectedCategories;

  const TaskForm({
    super.key,
    required this.task,
    required this.categories,
    required this.selectedCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: <Widget>[
          TaskSection(task: task),
          const SizedBox(height: 20),
          CategorySection(
            categories: categories,
            selectedCategories: selectedCategories,
          ),
          const SizedBox(height: 20),
          ActionButtons(task: task, selectedCategories: selectedCategories),
        ],
      ),
    );
  }
}
