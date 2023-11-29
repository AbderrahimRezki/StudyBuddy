import 'package:flutter/material.dart';
import 'package:study_buddy/domain/entities/user_entity.dart';
import 'package:study_buddy/presentation/pages/community/community.dart';

import 'core/theme/color_scheme.dart';
import 'presentation/widgets/skeleton/navigation_bar.dart';
import 'presentation/widgets/skeleton/top_bar.dart';

void main() {
  const UserEntity user = UserEntity(
    nickName: "Mohamed",
    profilePicturePath: "assets/images/male.png",
    progress: 70,
  );

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
  final List<Widget> pages = [const Community()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: themeData,
        home: SafeArea(
          child: Scaffold(
              backgroundColor: MyColorScheme.backgroundColor,
              appBar: TopBar(user: widget.user),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [pages[pageIndex], const MyNavigationBar()],
              )),
        ));
  }
}
