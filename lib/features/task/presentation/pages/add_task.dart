import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/top_bar.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/presentation/bloc/categories_cubit.dart';
import 'package:study_buddy/features/task/presentation/bloc/categories_state.dart';
import 'package:study_buddy/features/task/presentation/widgets/task_form.dart';
import 'package:study_buddy/features/task/presentation/widgets/task_form_controllers.dart';

class AddTaskScreenState extends StatefulWidget {
  static const pageRoute = "/task/add";

  final TaskEntity? task;
  const AddTaskScreenState({Key? key, this.task}) : super(key: key);

  @override
  State<AddTaskScreenState> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreenState> {
  Map<CategoryEntity, bool>? selectedCategories;

  @override
  void initState() {
    selectedCategories = {
      for (var k in widget.task?.taskCategories ?? []) k: true
    };
    // selectedCategories = mapFromList(widget.task?.taskCategories ?? []);
    TaskFormControllers.titleController.text =
        (widget.task?.taskTitle != null) ? widget.task!.taskTitle! : "";
    TaskFormControllers.descriptionController.text =
        (widget.task?.taskDescription != null)
            ? widget.task!.taskDescription!
            : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TopBar(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                return TaskForm(
                  task: widget.task,
                  categories: state.categories ?? [],
                  selectedCategories: selectedCategories ?? {},
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
