import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/pomodoro/presentation/bloc/cubits/pomodoro_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/task/presentation/bloc/categories_cubit.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_cubit.dart';

class AppProviders {
  static final providers = [
    BlocProvider<PageCubit>(create: (context) => locator<PageCubit>()),
    BlocProvider<TasksCubit>(
        create: (context) => locator<TasksCubit>()..getPendingTasks()),
    BlocProvider<PomodoroCubit>(create: (context) => locator<PomodoroCubit>()),
    BlocProvider<CategoryCubit>(
        create: (context) => locator<CategoryCubit>()..getAllCategories())
  ];
}
