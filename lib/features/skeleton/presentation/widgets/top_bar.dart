import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/features/community/domain/entities/user_entity.dart';
import 'package:study_buddy/features/notifications/notifications.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/avatar_image.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/user_progress.dart';
import 'package:study_buddy/features/userprofile/userprofilescreen.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final UserEntity user;
  const TopBar({super.key, required this.user});

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: buildTopBarContent(),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }

  Row buildTopBarContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfileScreen()));
          },
          child: AvatarImage(
              profilePicturePath: widget.user.profilePicturePath, radius: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: buildColumn(),
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsPage()));
            },
            icon: Icon(
              Icons.notifications,
              color: MyColorScheme.secondaryColor,
              size: 32,
            ))
      ],
    );
  }

  SizedBox buildColumn() {
    return SizedBox(
      width: 200,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildWelcomeText(),
            UserProgress(userProgress: widget.user.progress),
          ]),
    );
  }

  RichText buildWelcomeText() {
    return RichText(
        text: TextSpan(
            text: "Hi, ",
            style: regularTextStyle,
            children: <TextSpan>[
          TextSpan(
            text: "${widget.user.nickName}!",
            style: boldTextStyle,
          )
        ]));
  }
}
