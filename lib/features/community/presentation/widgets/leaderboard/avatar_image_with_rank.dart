import 'package:flutter/material.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/avatar_image.dart';

class AvatarImageWithRank extends StatelessWidget {
  final UserEntity user;
  final int rank;
  const AvatarImageWithRank(
      {super.key, required this.user, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildImageWithRank(),
          const SizedBox(
            height: 15,
          ),
          Text(
            user.nickName,
            style: boldTextStyle,
          ),
          buildScoreBadge()
        ],
      ),
    );
  }

  Stack buildImageWithRank() {
    return Stack(
        alignment: const Alignment(0, 2),
        children: [buildAvatarImage(), buildRank()]);
  }

  Container buildAvatarImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: MyColorScheme.green, width: 5),
      ),
      child: AvatarImage(
        profilePicturePath: user.profilePicturePath,
        radius: 40,
      ),
    );
  }

  Container buildRank() {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: MyColorScheme.backgroundColor, width: 5),
            shape: BoxShape.circle,
            color: MyColorScheme.secondaryColor),
        child: Text(
          "$rank",
          style: boldTextStyle.copyWith(
            color: MyColorScheme.white,
          ),
        ));
  }

  Container buildScoreBadge() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
      decoration: BoxDecoration(
          color: MyColorScheme.green, borderRadius: BorderRadius.circular(20)),
      child: Text(
        "${user.progress} XP",
        style: boldTextStyle.copyWith(color: MyColorScheme.white),
      ),
    );
  }
}
