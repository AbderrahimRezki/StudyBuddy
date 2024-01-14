class TaskCategoryRelation {
  final int? id;
  final int taskId;
  final int categoryId;

  TaskCategoryRelation(
      {this.id, required this.taskId, required this.categoryId});

  Map<String, dynamic> toJson() {
    var map = {"taskId": taskId, "categoryId": categoryId};

    if (id != null) {
      map["id"] = id!;
    }

    return map;
  }
}
