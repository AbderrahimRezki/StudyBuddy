import 'package:flutter/material.dart';
import 'package:study_buddy/core/theme/color_scheme.dart';
import 'package:study_buddy/domain/entities/user_entity.dart';
import 'package:study_buddy/presentation/widgets/avatar_image.dart';

class RemainingUsersRow extends StatelessWidget {
  const RemainingUsersRow({super.key, required this.user, this.index = 0});

  final UserEntity user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(1, 1),
              color: MyColorScheme.lightGray)
        ], color: MyColorScheme.white, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Text("${index + 4}", style: boldTextStyle),
              const SizedBox(
                width: 10,
              ),
              AvatarImage(
                profilePicturePath: user.profilePicturePath,
                radius: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                user.nickName,
                style: boldTextStyle,
              ),
            ]),
          ),
          const Spacer(),
          Text(
            "${user.progress} XP",
            style: boldTextStyle,
          )
        ]));
  }
}
