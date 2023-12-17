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
      super.taskIsDone});

  factory TaskModel.fromEntity(TaskEntity task) {
    return TaskModel(
        taskId: task.taskId,
        userId: task.userId,
        taskTitle: task.taskTitle,
        taskDescription: task.taskDescription,
        taskPriority: task.taskPriority,
        taskDueDate: task.taskDueDate,
        taskIsDone: task.taskIsDone);
  }

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
        taskId: map["taskId"],
        taskTitle: map["taskTitle"] ?? "",
        taskDescription: map["taskDescription"] ?? "",
        taskPriority: map["taskPriority"] ?? 0,
        taskDueDate: map["dueDate"],
        taskIsDone: map["isDone"]);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "taskTitle": taskTitle ?? "Title",
      "taskDescription": taskDescription ?? "Desc",
      "taskPriority": taskPriority,
      "taskDueDate": taskDueDate,
      "taskIsDone": taskIsDone == true ? 1 : 0
    };

    if (taskId != null) map["taskId"] = taskId;

    return map;
  }
}
