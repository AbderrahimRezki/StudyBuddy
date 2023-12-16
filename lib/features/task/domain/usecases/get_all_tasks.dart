import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';

class GetAllTasksUseCase implements UseCase<List<TaskEntity>, TaskRepository> {
  @override
  Future<List<TaskEntity>> call(TaskRepository taskRepository) async {
    var result = await taskRepository.getAllTasks();
    print(result);
    return result;
  }
}
