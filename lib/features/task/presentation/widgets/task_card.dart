import 'package:flutter/material.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: (task.taskIsDone ?? false) ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.taskTitle == "" ? "Untitled" : task.taskTitle.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (task.taskDescription != "")
            Text(
              task.taskDescription.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: MyColorScheme.lightGray,
              ),
            ),
          const SizedBox(height: 8),
          Row(
            children: [
              for (var i = 0; i < 3; i++)
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: i <= (task.taskPriority ?? 0)
                        ? MyColorScheme.red
                        : MyColorScheme.lightGray,
                    borderRadius: priorityShape,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ..._buildCategories(context, task.taskCategories ?? []),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "\u221E",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTag(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: MyColorScheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<Widget> _buildCategories(context, categories) {
    List<Widget> categoryChips = [];

    for (var category in categories) {
      categoryChips.add(_buildCategoryTag(context, category.categoryName));
      categoryChips.add(const SizedBox(width: 8));
    }

    return categoryChips;
  }
}
