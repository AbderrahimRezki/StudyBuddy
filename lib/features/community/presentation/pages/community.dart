import 'package:flutter/material.dart';
import 'package:study_buddy/core/constants/dummy.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/features/community/presentation/pages/feed.dart';
import 'package:study_buddy/features/community/presentation/pages/leaderboard.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/navigation_bar.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/top_bar.dart';

class Community extends StatelessWidget {
  static const pageRoute = "/community";
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const TopBar(user: user),
            body: Stack(alignment: Alignment.bottomCenter, children: [
              DefaultTabController(
                  length: 2,
                  child: Scaffold(
                      appBar: AppBar(
                          elevation: 0,
                          backgroundColor: MyColorScheme.backgroundColor,
                          title: TabBar(
                            labelColor: MyColorScheme.primaryColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: MyColorScheme.primaryColor,
                            labelPadding:
                                const EdgeInsets.fromLTRB(10, 20.0, 20.0, 10),
                            padding: EdgeInsets.zero,
                            tabs: const [
                              Text("Feed"),
                              Text("Leaderboard"),
                            ],
                          )),
                      body: const TabBarView(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Feed(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: LeaderBoard(),
                          )
                        ],
                      ))),
              const MyNavigationBar()
            ])));
  }
}