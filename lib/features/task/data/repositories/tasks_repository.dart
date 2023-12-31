import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';
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
    return await locator<TaskDao>().deleteTask(taskModel);
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    var result = await locator<TaskDao>().getAllTasks();

    final List<TaskModel> tasks = [];

    for (var item in result) {
      tasks.add(TaskModel.fromJson(item));
    }

    return tasks;
  }

  @override
  Future<List<CategoryModel>> getTaskCategories(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    return await TaskCategoryDao.getAllTaskCategories(taskModel);
  }

  @override
  Future<bool> updateTask(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    return await locator<TaskDao>().updateTask(taskModel);
  }

  @override
  Future<List<TaskModel>> getPendingTasks() async {
    var result = await locator<TaskDao>().getPendingTasks();
    final List<TaskModel> tasks = [];

    for (var task in result) {
      tasks.add(TaskModel.fromJson(task));
    }

    return tasks;
  }
}
