import 'package:get_it/get_it.dart';
import 'package:study_buddy/features/community/data/repositories/post_repository.dart';
import 'package:study_buddy/features/community/domain/usecases/get_all_posts.dart';
import 'package:study_buddy/features/pomodoro/presentation/bloc/cubits/pomodoro_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/category_dao.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/task_category_dao.dart';
import 'package:study_buddy/features/task/data/data_sources/local/dao/task_dao.dart';
import 'package:study_buddy/features/task/data/repositories/categories_repository.dart';
import 'package:study_buddy/features/task/data/repositories/tasks_repository.dart';
import 'package:study_buddy/features/task/domain/repositories/categories_repository.dart';
import 'package:study_buddy/features/task/domain/repositories/tasks_repository.dart';
import 'package:study_buddy/features/task/domain/usecases/add_task.dart';
import 'package:study_buddy/features/task/domain/usecases/delete_task.dart';
import 'package:study_buddy/features/task/domain/usecases/edit_task.dart';
import 'package:study_buddy/features/task/domain/usecases/get_all_categories.dart';
import 'package:study_buddy/features/task/domain/usecases/get_all_tasks.dart';
import 'package:study_buddy/features/task/domain/usecases/get_pending_tasks.dart';
import 'package:study_buddy/features/task/domain/usecases/mark_task_as_done.dart';
import 'package:study_buddy/features/task/presentation/bloc/categories_cubit.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_cubit.dart';

final locator = GetIt.instance;

void initializeDependencies() async {
  // DAOs
  locator.registerSingleton(TaskDao());
  locator.registerSingleton(CategoryDao());
  locator.registerSingleton(TaskCategoryDao());

  // Repositories
  TaskRepository taskRepository = TaskRepositoryImpl();
  locator.registerSingleton(taskRepository);

  CategoriesRepository categoriesRepository = CategoriesRepositoryImpl();
  locator.registerSingleton(categoriesRepository);

  PostRepositoryImpl postRepository = PostRepositoryImpl();
  locator.registerSingleton(postRepository);

  // Task usecases
  final addTaskUseCase = AddTaskUseCase(locator());
  locator.registerSingleton(addTaskUseCase);

  final editTaskUseCase = EditTaskUseCase(locator());
  locator.registerSingleton(editTaskUseCase);

  final deleteTaskUseCase = DeleteTaskUseCase(locator());
  locator.registerSingleton(deleteTaskUseCase);

  final getAllTasksUseCase = GetAllTasksUseCase(locator());
  locator.registerSingleton(getAllTasksUseCase);

  final getPendingTasksUseCase = GetPendingTasksUseCase(locator());
  locator.registerSingleton(getPendingTasksUseCase);

  final markTaskAsDoneUseCase = MarkTaskAsDoneUseCase(locator());
  locator.registerSingleton(markTaskAsDoneUseCase);

  // Category usecases
  final getAllCategoriesUseCase = GetAllCategoriesUseCase(locator());
  locator.registerSingleton(getAllCategoriesUseCase);

  // Community usecase
  final getAllPosts = GetAllPostsUseCase(postRepository);
  locator.registerSingleton(getAllPosts);

  // Cubits
  locator.registerSingleton(PageCubit());
  locator.registerSingleton(PomodoroCubit());
  locator.registerSingleton(TasksCubit(
      locator(), locator(), locator(), locator(), locator(), locator()));
  locator.registerSingleton(CategoryCubit(locator()));
}
