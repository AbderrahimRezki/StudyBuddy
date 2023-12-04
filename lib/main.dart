import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/core/constants/routes.dart';
import 'package:study_buddy/features/notifications/notifications.dart';
import 'package:study_buddy/features/addtask/presentation/pages/addtask.dart';
import 'package:study_buddy/features/community/presentation/pages/community.dart';
import 'package:study_buddy/features/pomodoro/presentation/pages/pomodoro_timer.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/navigation_bar.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/top_bar.dart';
import 'package:study_buddy/features/userprofile/userprofilescreen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => PageCubit(),
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
    // print("Updated ${context.watch<PageCubit>().state.index}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: BlocBuilder<PageCubit, PageState>(builder: (context, state) {
        return SafeArea(
            child: Scaffold(
                backgroundColor: MyColorScheme.backgroundColor,
                appBar: TopBar(user: state.loggedInUser),
                body: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    state.pages[context.watch<PageCubit>().state.index],
                    const MyNavigationBar()
                  ],
                )));
      }),
      routes: {
        profileRoute: (context) => const UserProfileScreen(),
        Pomodoro.pageRoute: (context) => const Pomodoro(),
        Community.pageRoute: (context) => const Community(),
        NotificationsPage.pageRoute: (context) => const NotificationsPage(),
        AddTaskScreenState.pageRoute: (context) => const AddTaskScreenState(),
      },
    );
  }
}
