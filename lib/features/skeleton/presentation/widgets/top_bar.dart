import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/features/notifications/notifications.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/avatar_image.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/user_progress.dart';
import 'package:study_buddy/features/userprofile/userprofilescreen.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        return Material(
          color: MyColorScheme.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: buildTopBarContent(context, state),
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              )
            ],
          ),
        );
      },
    );
  }

  Row buildTopBarContent(context, state) {
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
              profilePicturePath: state.loggedInUser.profilePicturePath,
              radius: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: buildColumn(state),
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

  SizedBox buildColumn(state) {
    return SizedBox(
      width: 200,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildWelcomeText(state),
            UserProgress(userProgress: state.loggedInUser.progress),
          ]),
    );
  }

  RichText buildWelcomeText(state) {
    return RichText(
        text: TextSpan(
            text: "Hi, ",
            style: regularTextStyle,
            children: <TextSpan>[
          TextSpan(
            text: "${state.loggedInUser.nickName}!",
            style: boldTextStyle,
          )
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
