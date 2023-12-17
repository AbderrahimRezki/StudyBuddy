import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/task/data/models/task_model.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';

class MarkTaskAsDoneUseCase extends UseCase<bool, TaskEntity> {
  final TaskRepository _taskRepository;
  MarkTaskAsDoneUseCase(this._taskRepository);

  @override
  Future<bool> call({TaskEntity? params}) async {
    TaskModel taskModel =
        TaskModel.fromEntity(params!).copyWith(taskIsDone: true);
    _taskRepository.updateTask(taskModel);
    return true;
  }
}
