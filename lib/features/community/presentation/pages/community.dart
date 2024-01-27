import 'package:flutter/material.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/community/presentation/pages/leaderboard.dart';

class Community extends StatelessWidget {
  static const pageRoute = "/community";
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
              child: Text(
            "Leaderboard",
            style: boldTextStyle,
          )),
          backgroundColor: MyColorScheme.backgroundColor,
        ),
        body: Material(
            color: MyColorScheme.backgroundColor,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: LeaderBoard(),
            )));
  }
}
