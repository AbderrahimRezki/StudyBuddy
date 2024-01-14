import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';

class EditTaskUseCase extends UseCase<bool, TaskEntity> {
  final TaskRepository _taskRepository;
  EditTaskUseCase(this._taskRepository);

  @override
  Future<bool> call({TaskEntity? params}) async {
    final taskModel = TaskModel.fromEntity(params!);
    return await _taskRepository.updateTask(taskModel);
  }
}
