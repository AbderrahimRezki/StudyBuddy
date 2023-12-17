import 'package:get_it/get_it.dart';
import 'package:study_buddy/features/community/data/repositories/post_repository.dart';
import 'package:study_buddy/features/community/domain/usecases/get_all_posts.dart';
import 'package:study_buddy/features/task/data/repositories/tasks_repository.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';
import 'package:study_buddy/features/task/domain/usecases/add_task.dart';
import 'package:study_buddy/features/task/domain/usecases/get_all_tasks.dart';

final locator = GetIt.instance;

void initializeDependencies() async {
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

  // Community usecase
  GetAllPostsUseCase getAllPosts = GetAllPostsUseCase(postRepository);
  locator.registerSingleton(getAllPosts);
}
