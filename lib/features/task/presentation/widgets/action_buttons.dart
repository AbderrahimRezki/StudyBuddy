import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_cubit.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_state.dart';
import 'package:study_buddy/features/task/presentation/widgets/task_form_controllers.dart';

class ActionButtons extends StatelessWidget {
  final TaskEntity? task;
  final Map<CategoryEntity, bool> selectedCategories;

  const ActionButtons(
      {super.key, required this.task, required this.selectedCategories});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                var title = TaskFormControllers.titleController.text;
                var description =
                    TaskFormControllers.descriptionController.text;
                var priority = TaskFormControllers.priorityController;

                final task0 = TaskEntity(
                    taskId: task?.taskId,
                    userId: task?.userId,
                    taskTitle: title,
                    taskDescription: description,
                    taskPriority: priority);

                selectedCategories
                    .removeWhere((category, isSelected) => isSelected == false);
                task0.taskCategories = [...selectedCategories.keys];

                if (task != null) {
                  context.read<TasksCubit>().editTask(task0);
                } else {
                  context.read<TasksCubit>().addTask(task0);
                }
                TaskFormControllers.titleController.text = "";
                TaskFormControllers.descriptionController.text = "";
                TaskFormControllers.priorityController = 0;
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                backgroundColor: const Color(0xFF32CD32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text('Save'),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
