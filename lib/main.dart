import 'package:flutter/material.dart';
import 'package:study_buddy/features/addtask/presentation/pages/addtask.dart';
import 'package:study_buddy/core/constants/routes.dart';
import 'package:study_buddy/features/community/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/presentation/pages/community.dart';
import 'package:study_buddy/features/pomodoro/presentation/pages/pomodoro_timer.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/navigation_bar.dart';
import 'package:study_buddy/features/userprofil/userprofilescreen.dart';

import 'core/constants/dummy.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(const MainApp(
    user: user,
  ));
}

class MainApp extends StatefulWidget {
  final UserEntity user;
  const MainApp({super.key, required this.user});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int pageIndex = 0;
  final List<Widget> pages = [const Pomodoro(), const Community()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: SafeArea(
        child: Scaffold(
            backgroundColor: MyColorScheme.backgroundColor,
            body: const Stack(
              alignment: Alignment.bottomCenter,
              children: [AddTaskScreenState(), MyNavigationBar()],
            )),
      ),
      routes: {
        Community.pageRoute: (context) => const Community(),
        Pomodoro.pageRoute: (context) => const Pomodoro(),
        AddTaskScreenState.pageRoute: (context) => const AddTaskScreenState(),
        profileRoute: (context) => const UserProfileScreen(),
      },
    );
  }
}
