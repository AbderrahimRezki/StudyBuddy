import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/widgets/feed/feed_content.dart';
import 'package:study_buddy/presentation/widgets/skeleton/search_bar.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MySearchBar(),
        FeedContent(),
      ],
    );
  }
}
