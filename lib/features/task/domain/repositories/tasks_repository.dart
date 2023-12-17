import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getAllTasks();
  Future<List<CategoryEntity>> getTaskCategories(TaskEntity task);
  Future<bool> addTask(TaskEntity task);
  Future<bool> updateTask(TaskEntity task);
  Future<bool> removeTask(TaskEntity task);
  Future<List<TaskEntity>> getPendingTasks();
}
