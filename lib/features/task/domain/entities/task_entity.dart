import 'package:equatable/equatable.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';

enum Priority {
  low(0),
  medium(1),
  high(2);

  final int priority;
  const Priority(this.priority);
}

// ignore: must_be_immutable
class TaskEntity extends Equatable {
  int? taskId;
  final int? userId;
  final String? taskTitle;
  final String? taskDescription;
  final int? taskPriority;
  final int? taskDueDate;
  final bool? taskIsDone;
  List<CategoryEntity>? taskCategories;

  TaskEntity(
      {this.taskId,
      this.userId,
      this.taskTitle,
      this.taskDescription,
      this.taskPriority = 0,
      this.taskDueDate,
      this.taskIsDone,
      this.taskCategories});

  @override
  List<Object?> get props => [
        taskId,
        userId,
        taskTitle,
        taskDescription,
        taskPriority,
        taskDueDate,
        taskIsDone,
        taskCategories
      ];
}
