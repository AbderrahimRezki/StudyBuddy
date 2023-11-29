import 'package:flutter/material.dart';
import 'package:study_buddy/core/theme/color_scheme.dart';
import 'package:study_buddy/presentation/pages/community/feed.dart';
import 'package:study_buddy/presentation/pages/community/leaderboard.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: MyColorScheme.backgroundColor,
                title: TabBar(
                  labelColor: MyColorScheme.primaryColor,
                  indicatorColor: MyColorScheme.primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.fromLTRB(10, 20.0, 20.0, 10),
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
            )));
  }
}
