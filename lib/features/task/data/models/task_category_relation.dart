class TaskCategoryRelation {
  final int id;
  final int taskId;
  final int categoryId;

  TaskCategoryRelation(
      {required this.id, required this.taskId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {"id": id, "taskId": taskId, "categoryId": categoryId};
  }
}
