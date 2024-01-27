import 'package:flutter/material.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/presentation/widgets/leaderboard/avatar_image_with_rank.dart';

class LeaderBoardRow extends StatelessWidget {
  final List<UserEntity> topUsers;
  const LeaderBoardRow({super.key, required this.topUsers});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < topUsers.length; i++)
              AvatarImageWithRank(user: topUsers[i], rank: (i + 1)),
          ],
        )
      ],
    );
  }
}
