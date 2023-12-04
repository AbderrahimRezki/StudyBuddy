import 'package:flutter/material.dart';
import 'package:study_buddy/features/community/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/presentation/widgets/leaderboard/remaining_users_row.dart';

class RemainingUsers extends StatefulWidget {
  const RemainingUsers({super.key});

  @override
  State<RemainingUsers> createState() => RemainingUsersState();
}

class RemainingUsersState extends State<RemainingUsers> {
  List<UserEntity> users = const [
    UserEntity(
        nickName: "Wassim",
        profilePicturePath: "assets/images/male.png",
        progress: 50)
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 98,
            itemBuilder: (context, index) => index > 96
                ? const SizedBox(
                    height: 100,
                  )
                : RemainingUsersRow(
                    user: users[0],
                    index: index,
                  )));
  }
}
