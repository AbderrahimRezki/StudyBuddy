import 'package:equatable/equatable.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';

abstract class TasksState extends Equatable {
  final List<TaskEntity>? tasks;

  const TasksState({this.tasks});

  @override
  List<Object> get props => [tasks!];
}

class TaskStateLoading extends TasksState {
  const TaskStateLoading();
}

class TasksStateDone extends TasksState {
  const TasksStateDone({super.tasks});
}
