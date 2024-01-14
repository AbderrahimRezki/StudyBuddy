import 'package:flutter/material.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/presentation/widgets/task_form_controllers.dart';

class TaskSection extends StatelessWidget {
  final TaskEntity? task;

  const TaskSection({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: TaskFormControllers.titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                  fontSize: 18,
                ),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
                fontSize: 18,
              ),
              onChanged: (value) {
                TaskFormControllers.titleController.text = value;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: TaskFormControllers.descriptionController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Today I will do ... ',
              ),
              style: const TextStyle(
                fontSize: 18,
              ),
              maxLines: 3,
              onChanged: (value) {
                TaskFormControllers.descriptionController.text = value;
              },
              onSaved: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
