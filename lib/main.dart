import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/pomodoro/presentation/bloc/cubits/pomodoro_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/top_bar.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/navigation_bar.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';
import 'package:study_buddy/features/task/presentation/bloc/task_cubit.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => locator<PageCubit>()),
      BlocProvider(
          create: (context) => locator<TasksCubit>()..getPendingTasks()),
      BlocProvider(create: (context) => locator<PomodoroCubit>())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<PageCubit, PageState>(builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                  backgroundColor: MyColorScheme.backgroundColor,
                  appBar: (state.pageHasBars()) ? const TopBar() : null,
                  body: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      state.currentPage,
                      if (state.pageHasBars()) const MyNavigationBar()
                    ],
                  )));
        }));
  }
}
