import 'package:flutter/material.dart';
import 'package:study_buddy/domain/entities/post_entity.dart';
import 'package:study_buddy/domain/entities/user_entity.dart';
import 'package:study_buddy/presentation/widgets/achievement_card.dart';

class FeedContent extends StatefulWidget {
  const FeedContent({super.key});

  @override
  State<FeedContent> createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> {
  final List<PostEntity> posts = [
    PostEntity(
        user: const UserEntity(
            nickName: "Karim",
            profilePicturePath: "assets/images/male.png",
            progress: 79),
        description:
            "Aliquid saepe et amet sit impedit nesciunt vel at dolores. Recusandae ut et. Omnis pariatur illo expedita. In laboriosam et officiis quis possimus. Et quas molestiae rerum voluptates vero dolorem. Error repudiandae et.",
        claps: 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return index < 9
                ? AchievementCard(
                    post: posts[0],
                  )
                : const SizedBox(
                    height: 100,
                  );
          }),
    );
  }
}
