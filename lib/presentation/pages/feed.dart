import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/widgets/feed_content.dart';
import 'package:study_buddy/presentation/widgets/search_bar.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MySearchBar(),
        FeedContent(),
      ],
    );
  }
}
