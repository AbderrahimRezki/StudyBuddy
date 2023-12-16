import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';

class AddTaskParams {
  final TaskRepository taskRepository;
  final TaskEntity task;

  const AddTaskParams({required this.taskRepository, required this.task});
}

class AddTaskUseCase implements UseCase<bool, AddTaskParams> {
  @override
  Future<bool> call(AddTaskParams params) async {
    print(params.task.props);
    if (await params.taskRepository.addTask(params.task)) {
      print("added");
      return true;
    }

    return false;
  }
}
