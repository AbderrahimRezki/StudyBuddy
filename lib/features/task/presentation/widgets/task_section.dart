import 'package:flutter/material.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/presentation/widgets/task_form_controllers.dart';

class TaskSection extends StatelessWidget {
  final TaskEntity? task;
  const TaskSection({super.key, this.task});

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
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColorScheme.lightGray,
                  fontSize: 18,
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColorScheme.textColor,
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
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Today I will do ... ',
                  hintStyle: TextStyle(color: MyColorScheme.lightGray)),
              style: TextStyle(fontSize: 18, color: MyColorScheme.textColor),
              maxLines: 3,
              onChanged: (value) {
                TaskFormControllers.descriptionController.text = value;
              },
              onSaved: (value) {},
            ),
            PriorityDots(task: task)
          ],
        ),
      ),
    );
  }
}

class PriorityDots extends StatefulWidget {
  final TaskEntity? task;
  const PriorityDots({super.key, this.task});

  @override
  State<PriorityDots> createState() => _PriorityDotsState();
}

class _PriorityDotsState extends State<PriorityDots> {
  int? priority;

  @override
  void initState() {
    priority = widget.task?.taskPriority ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          InkWell(
            onTap: () {
              setState(() {
                priority = i;
              });

              TaskFormControllers.priorityController = i;
            },
            child: Container(
              width: 20,
              height: 10,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: (i <= (priority ?? 0))
                      ? MyColorScheme.red
                      : MyColorScheme.lightGray,
                  borderRadius: priorityShape),
              // child: const Text("Hello"),
            ),
          ),
      ],
    );
  }
}
