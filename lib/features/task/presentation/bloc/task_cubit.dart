import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/domain/usecases/add_task.dart';
import 'package:study_buddy/features/task/domain/usecases/delete_task.dart';
import 'package:study_buddy/features/task/domain/usecases/get_all_tasks.dart';
import 'package:study_buddy/features/task/domain/usecases/get_pending_tasks.dart';
import 'package:study_buddy/features/task/domain/usecases/mark_task_as_done.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final AddTaskUseCase _addTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final MarkTaskAsDoneUseCase _asDoneUseCase;
  final GetAllTasksUseCase _getAllTasksUseCase;
  final GetPendingTasksUseCase _getPendingTasksUseCase;

  TasksCubit(this._addTaskUseCase, this._deleteTaskUseCase, this._asDoneUseCase,
      this._getAllTasksUseCase, this._getPendingTasksUseCase)
      : super(const TasksState());

  void getAllTasks() async {
    final List<TaskEntity> tasks = await _getAllTasksUseCase();
    emit(TasksStateDone(tasks: tasks));
  }

  void getPendingTasks() async {
    final List<TaskEntity> tasks = await _getPendingTasksUseCase();
    emit(TasksStateDone(tasks: tasks));
  }

  void addTask(TaskEntity task) async {
    await _addTaskUseCase(params: task);
    getPendingTasks();
  }

  void markTaskAsDone(TaskEntity task) async {
    await _asDoneUseCase(params: task);
    getPendingTasks();
  }

  void deleteTask(TaskEntity task) async {
    await _deleteTaskUseCase(params: task);
    getPendingTasks();
  }
}
