import 'package:study_buddy/features/task/data/data_sources/local/dao/task_category_dao.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/task_dao.dart';
import 'package:study_buddy/features/task/data/models/category_model.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<bool> addTask(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    return TaskDao.addTask(taskModel);
  }

  @override
  Future<bool> removeTask(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    return TaskDao.deleteTask(taskModel);
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    return await TaskDao.getAllTasks();
  }

  @override
  Future<List<CategoryModel>> getTaskCategories(TaskEntity task) async {
    TaskModel taskModel = TaskModel.fromEntity(task);
    return await TaskCategoryDao.getAllTaskCategories(taskModel);
  }
}
