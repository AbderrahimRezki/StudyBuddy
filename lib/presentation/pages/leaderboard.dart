import 'package:flutter/material.dart';
import 'package:study_buddy/domain/entities/user_entity.dart';
import 'package:study_buddy/presentation/widgets/leaderboard_row.dart';
import 'package:study_buddy/presentation/widgets/remaining_users.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final List<UserEntity> topUsers = const [
    UserEntity(
        nickName: "Karim",
        profilePicturePath: "assets/images/male.png",
        progress: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [LeaderBoardRow(topUsers: topUsers), const RemainingUsers()],
    );
  }
}
