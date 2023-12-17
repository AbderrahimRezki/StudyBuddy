import 'package:get_it/get_it.dart';
import 'package:study_buddy/features/community/data/repositories/post_repository.dart';
import 'package:study_buddy/features/community/domain/usecases/get_all_posts.dart';
import 'package:study_buddy/features/pomodoro/presentation/bloc/cubits/pomodoro_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/task_dao.dart';
import 'package:study_buddy/features/task/data/repositories/tasks_repository.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';
import 'package:study_buddy/features/task/domain/usecases/add_task.dart';
import 'package:study_buddy/features/task/domain/usecases/get_all_tasks.dart';
import 'package:study_buddy/features/task/domain/usecases/get_pending_tasks.dart';
import 'package:study_buddy/features/task/domain/usecases/mark_task_as_done.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_cubit.dart';

final locator = GetIt.instance;

void initializeDependencies() async {
  // DAOs
  locator.registerSingleton<TaskDao>(TaskDao());

  // Repositories
  TaskRepository taskRepository = TaskRepositoryImpl();
  locator.registerSingleton(taskRepository);

  PostRepositoryImpl postRepository = PostRepositoryImpl();
  locator.registerSingleton(postRepository);

  // Task usecases
  AddTaskUseCase addTaskUseCase = AddTaskUseCase(locator());
  locator.registerSingleton(addTaskUseCase);

  GetAllTasksUseCase getAllTasksUseCase = GetAllTasksUseCase(locator());
  locator.registerSingleton(getAllTasksUseCase);

  GetPendingTasksUseCase getPendingTasksUseCase =
      GetPendingTasksUseCase(locator());
  locator.registerSingleton(getPendingTasksUseCase);

  MarkTaskAsDoneUseCase markTaskAsDoneUseCase =
      MarkTaskAsDoneUseCase(locator());
  locator.registerSingleton(markTaskAsDoneUseCase);

  // Community usecase
  GetAllPostsUseCase getAllPosts = GetAllPostsUseCase(postRepository);
  locator.registerSingleton(getAllPosts);

  // Cubits
  locator.registerSingleton(PageCubit());
  locator.registerSingleton(PomodoroCubit());
  locator.registerSingleton(
      TasksCubit(locator(), locator(), locator(), locator()));
}
