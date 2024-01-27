import 'package:flutter/material.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/presentation/widgets/leaderboard/remaining_users_row.dart';

class RemainingUsers extends StatefulWidget {
  final List<UserEntity>? users;
  const RemainingUsers({super.key, this.users});

  @override
  State<RemainingUsers> createState() => RemainingUsersState();
}

class RemainingUsersState extends State<RemainingUsers> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.users?.length ?? 0,
            itemBuilder: (context, index) => index > 96
                ? const SizedBox(
                    height: 100,
                  )
                : RemainingUsersRow(
                    user: widget.users![0],
                    index: index,
                  )));
  }
}
