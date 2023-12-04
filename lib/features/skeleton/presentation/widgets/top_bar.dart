import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_buddy/core/constants/routes.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/features/community/domain/entities/user_entity.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/avatar_image.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/user_progress.dart';

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
          onTap: () => Navigator.of(context).pushReplacementNamed(profileRoute),
          child: AvatarImage(
              profilePicturePath: widget.user.profilePicturePath, radius: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: buildColumn(),
        ),
        SvgPicture.asset(
          "assets/icons/notifications.svg",
          width: 30,
          height: 30,
          colorFilter: ColorFilter.mode(MyColorScheme.green, BlendMode.srcIn),
          fit: BoxFit.contain,
        )
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
