import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/task/data/models/task_category_relation.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/task_category_dao.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/task_dao.dart';
import 'package:study_buddy/features/task/data/models/category_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<bool> addTask(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    return await locator<TaskDao>().addTask(taskModel);
  }

  @override
  Future<bool> removeTask(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    await locator<TaskDao>().deleteTask(taskModel);

    taskModel.taskCategories ??= [];
    for (CategoryEntity category in taskModel.taskCategories!) {
      await locator<TaskCategoryDao>().deleteTaskCategory(TaskCategoryRelation(
          taskId: taskModel.taskId!, categoryId: category.categoryId!));
    }

    return true;
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    var result = await locator<TaskDao>().getAllTasks();

    final List<TaskModel> tasks = [];

    for (var item in result) {
      TaskModel task = TaskModel.fromJson(item);
      final taskCategories = await getTaskCategories(task);
      task.taskCategories = taskCategories;

      tasks.add(task);
    }

    return tasks;
  }

  @override
  Future<List<CategoryModel>> getTaskCategories(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    var result =
        await locator<TaskCategoryDao>().getAllTaskCategories(taskModel);
    final List<CategoryModel> categories = [];

    for (var category in result) {
      categories.add(CategoryModel.fromJson(category));
    }

    return categories;
  }

  @override
  Future<bool> updateTask(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    await locator<TaskDao>().updateTask(taskModel);
    await locator<TaskCategoryDao>().deleteTaskCategories(taskModel.taskId!);
    for (var category in taskModel.taskCategories ?? []) {
      final relation = TaskCategoryRelation(
          taskId: taskModel.taskId!, categoryId: category.categoryId);
      await locator<TaskCategoryDao>().addTaskCategory(relation);
    }
    return true;
  }

  @override
  Future<List<TaskModel>> getPendingTasks() async {
    var result = await locator<TaskDao>().getPendingTasks();
    final List<TaskModel> tasks = [];

    for (var item in result) {
      TaskModel task = TaskModel.fromJson(item);
      task.taskCategories = await getTaskCategories(task);
      tasks.add(task);
    }

    return tasks;
  }
}
