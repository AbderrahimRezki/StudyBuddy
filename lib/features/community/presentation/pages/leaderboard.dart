import 'package:flutter/material.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/presentation/widgets/leaderboard/leaderboard_row.dart';
import 'package:study_buddy/features/community/presentation/widgets/leaderboard/remaining_users.dart';
import 'package:study_buddy/main.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            supabase.from("profiles").select("*").order("progress").limit(50),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final topFifty = (snapshot.data ?? [])
              .map((user) => UserEntity.fromJson(user))
              .toList();

          final topThree = topFifty.take(3).toList();

          List<UserEntity> remaining;
          if (topFifty.length > 3) {
            remaining = topFifty.sublist(4);
          } else {
            remaining = [];
          }

          return topFifty.isNotEmpty
              ? Column(children: [
                  LeaderBoardRow(topUsers: topThree),
                  RemainingUsers(users: remaining)
                ])
              : const Center(
                  child: Text("Not enough users"),
                );
        });
  }
}
