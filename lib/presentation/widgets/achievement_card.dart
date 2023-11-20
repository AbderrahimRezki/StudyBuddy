import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_buddy/core/theme/color_scheme.dart';
import 'package:study_buddy/domain/entities/post_entity.dart';
import 'package:study_buddy/presentation/widgets/card_content.dart';

class AchievementCard extends StatefulWidget {
  final PostEntity post;
  const AchievementCard({super.key, required this.post});

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  bool isLiked = false;
  Color clapsColor = MyColorScheme.textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: MyColorScheme.white,
        borderRadius: BorderRadius.circular(10),
        shadowColor: MyColorScheme.lightGray,
        elevation: 1,
        child: buildCardContent(),
      ),
    );
  }

  Stack buildCardContent() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Image.asset("assets/backgrounds/medal.png"),
        buildColumn(),
      ],
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardContent(
          post: widget.post,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 15),
          child: buildRow(),
        ),
      ],
    );
  }

  Row buildRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/hands-clapping.svg",
              colorFilter: ColorFilter.mode(clapsColor, BlendMode.srcIn)),
          onPressed: () {
            isLiked ? widget.post.claps-- : widget.post.claps++;
            isLiked = !isLiked;
            clapsColor =
                isLiked ? MyColorScheme.primaryColor : MyColorScheme.textColor;
            setState(() {});
          },
        ),
        Text(
          "${widget.post.claps}",
          style: TextStyle(color: clapsColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
