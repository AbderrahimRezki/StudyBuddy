import 'package:flutter/material.dart';
import 'package:study_buddy/features/community/domain/entities/post_entity.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/avatar_image.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              AvatarImage(
                  profilePicturePath: post.user.profilePicturePath ?? "",
                  radius: 20),
              const SizedBox(
                width: 8,
              ),
              Text(post.user.nickName,
                  softWrap: true,
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    post.description,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
