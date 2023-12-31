import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';

class DeleteTaskUseCase extends UseCase<bool, TaskEntity> {
  final TaskRepository _taskRepository;
  DeleteTaskUseCase(this._taskRepository);

  @override
  Future<bool> call({TaskEntity? params}) {
    return _taskRepository.removeTask(params!);
  }
}
