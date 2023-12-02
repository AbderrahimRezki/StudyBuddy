import 'package:flutter/material.dart';
import 'package:study_buddy/domain/entities/user_entity.dart';
import 'package:study_buddy/presentation/pages/community/community.dart';
import 'package:study_buddy/presentation/pages/tasks_list/tasks.dart';

import 'core/theme/color_scheme.dart';
import 'presentation/widgets/skeleton/navigation_bar.dart';
import 'presentation/widgets/skeleton/top_bar.dart';
import 'presentation/widgets/skeleton/task_card.dart';

void main() {
  const UserEntity user = UserEntity(
    nickName: "Mohamed",
    profilePicturePath: "assets/images/male.png",
    progress: 70,
  );

  runApp(MainApp(
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
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const Community(),
      TasksPage(user: widget.user), // Pass 'widget.user' to the TasksPage
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: MyColorScheme.backgroundColor,
          appBar:
              TopBar(user: widget.user), // TopBar takes 'user' as a parameter
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // IndexedStack is used to maintain the state of the off-screen page
              IndexedStack(
                index: pageIndex,
                children: pages,
              ),
              MyNavigationBar(onPageSelected: (index) {
                setState(() {
                  pageIndex = index;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class MyNavigationBar extends StatelessWidget {
  final Function(int) onPageSelected;
  const MyNavigationBar({super.key, required this.onPageSelected});

  @override
  Widget build(BuildContext context) {
    final _MainAppState state =
        context.findAncestorStateOfType<_MainAppState>()!;

    return BottomNavigationBar(
      currentIndex: state.pageIndex,
      onTap: onPageSelected, // Use the passed function to handle page switching
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Tasks',
        ),
      ],
    );
  }
}
