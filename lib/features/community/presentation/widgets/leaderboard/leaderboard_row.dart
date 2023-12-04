import 'package:flutter/material.dart';
import 'package:study_buddy/features/community/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/presentation/widgets/leaderboard/avatar_image_with_rank.dart';

class LeaderBoardRow extends StatelessWidget {
  final List<UserEntity> topUsers;
  const LeaderBoardRow({super.key, required this.topUsers});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AvatarImageWithRank(user: topUsers[0], rank: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AvatarImageWithRank(user: topUsers[0], rank: 2),
            AvatarImageWithRank(user: topUsers[0], rank: 3),
          ],
        )
      ],
    );
  }
}
