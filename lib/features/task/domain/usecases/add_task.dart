import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';

class AddTaskUseCase implements UseCase<bool, TaskEntity> {
  final TaskRepository _taskRepository;
  const AddTaskUseCase(this._taskRepository);

  @override
  Future<bool> call({TaskEntity? params}) async {
    return _taskRepository.addTask(params!);
  }
}
