import 'package:flutter/material.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/progress_bar.dart';

class UserProgress extends StatelessWidget {
  final int userProgress;
  const UserProgress({super.key, required this.userProgress});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 8,
          child: ProgressBar(
              value: userProgress / 100,
              foregroundColor: MyColorScheme.green,
              backgroundColor: const Color(0xFFD9D9D9)),
        ),
        const SizedBox(
          width: 8,
        ),
        Text("$userProgress XP",
            style: TextStyle(
                color: MyColorScheme.green, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
