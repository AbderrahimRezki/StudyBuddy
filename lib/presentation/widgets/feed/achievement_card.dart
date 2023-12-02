import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/domain/entities/post_entity.dart';
import 'package:study_buddy/presentation/bloc/cubits/post_cubit.dart';
import 'package:study_buddy/presentation/bloc/states/post_state.dart';
import 'package:study_buddy/presentation/widgets/feed/card_content.dart';

class AchievementCard extends StatelessWidget {
  final PostEntity post;
  const AchievementCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: MyColorScheme.white,
            borderRadius: BorderRadius.circular(10),
            shadowColor: MyColorScheme.lightGray,
            elevation: 1,
            child: buildCardContent(context),
          ),
        );
      },
    );
  }

  Stack buildCardContent(context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Image.asset("assets/backgrounds/medal.png"),
        buildColumn(context),
      ],
    );
  }

  Column buildColumn(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardContent(
          post: post,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 15),
          child: buildRow(context),
        ),
      ],
    );
  }

  Widget buildRow(context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        Color clapsColor = state.post.isClapped
            ? MyColorScheme.clapColor
            : MyColorScheme.textColor;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/hands-clapping.svg",
                  colorFilter: ColorFilter.mode(clapsColor, BlendMode.srcIn)),
              onPressed: () {
                context.read<PostCubit>().toggleClap();
              },
            ),
            Text(
              // "${widget.post.claps}",
              "${state.post.claps}",
              style: TextStyle(color: clapsColor, fontWeight: FontWeight.bold),
            )
          ],
        );
      },
    );
  }
}
