import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/avatar_image.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/user_progress.dart';
import 'package:study_buddy/features/userprofile/bloc/user_cubit.dart';
import 'package:study_buddy/features/userprofile/userprofilescreen.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final pageState = context.watch<PageCubit>().state;
        final userState = context.watch<UserCubit>().state;

        return Material(
          color: MyColorScheme.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: buildTopBarContent(context, pageState, userState),
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

  Widget buildTopBarContent(context, pageState, userState) {
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
              profilePicturePath:
                  userState.loggedInUser?.profilePicturePath ?? "",
              radius: 20),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: buildColumn(userState),
          ),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
              onPressed: () async {
                locator<UserCubit>().logOut();
              },
              icon: Icon(
                Icons.logout,
                color: MyColorScheme.red,
                size: 28,
              )),
        )
      ],
    );
  }

  Widget buildColumn(state) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildWelcomeText(state),
          const SizedBox(
            height: 8,
          ),
          UserProgress(userProgress: (state.loggedInUser?.progress ?? 0) % 100),
        ]);
  }

  Widget buildWelcomeText(state) {
    return Row(
      children: [
        RichText(
            text: TextSpan(
                text: "Hi, ",
                style: regularTextStyle,
                children: <TextSpan>[
              TextSpan(
                text: "${state.loggedInUser?.nickName}!",
                style: regularTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ])),
        const Spacer(),
        Text(
          "lvl: ${state.loggedInUser?.progress ~/ 100 + 1}",
          style:
              boldTextStyle.copyWith(color: MyColorScheme.green, fontSize: 16),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
