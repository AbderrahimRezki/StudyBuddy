import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';

class GetAllTasksUseCase implements UseCase<List<TaskEntity>, void> {
  final TaskRepository _taskRepository;

  const GetAllTasksUseCase(this._taskRepository);

  @override
  Future<List<TaskEntity>> call({void params}) async {
    return await _taskRepository.getAllTasks();
  }
}
