import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';

// ignore: must_be_immutable
class TaskModel extends TaskEntity {
  TaskModel(
      {super.taskId,
      super.userId,
      super.taskTitle,
      super.taskDescription,
      super.taskPriority = 0,
      super.taskDueDate,
      super.taskIsDone,
      super.taskCategories});

  factory TaskModel.fromEntity(TaskEntity task) {
    return TaskModel(
        taskId: task.taskId,
        userId: task.userId,
        taskTitle: task.taskTitle,
        taskDescription: task.taskDescription,
        taskPriority: task.taskPriority,
        taskDueDate: task.taskDueDate,
        taskIsDone: task.taskIsDone,
        taskCategories: task.taskCategories);
  }

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
        taskId: map["taskId"],
        taskTitle: map["taskTitle"] ?? "",
        taskDescription: map["taskDescription"] ?? "",
        taskPriority: map["taskPriority"] ?? 0,
        taskDueDate: map["dueDate"],
        taskIsDone: map["isDone"],
        taskCategories: map["taskCategories"]);
  }

  TaskModel copyWith(
      {int? taskId,
      int? userId,
      String? taskTitle,
      String? taskDescription,
      int? taskPriority,
      int? taskDueDate,
      bool? taskIsDone,
      List<CategoryEntity>? taskCategories}) {
    return TaskModel(
        taskId: taskId ?? this.taskId,
        userId: userId ?? this.userId,
        taskTitle: taskTitle ?? this.taskTitle,
        taskDescription: taskDescription ?? this.taskDescription,
        taskPriority: taskPriority ?? this.taskPriority,
        taskDueDate: taskDueDate ?? this.taskDueDate,
        taskIsDone: taskIsDone ?? this.taskIsDone,
        taskCategories: taskCategories ?? this.taskCategories);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "taskTitle": taskTitle ?? "Title",
      "taskDescription": taskDescription ?? "",
      "taskPriority": taskPriority,
      "taskDueDate": taskDueDate,
      "taskIsDone": taskIsDone == true ? 1 : 0
    };

    if (taskId != null) map["taskId"] = taskId;
    return map;
  }
}
