import 'package:flutter/material.dart';
import 'package:study_buddy/core/theme/theme.dart';

class AvatarImage extends StatelessWidget {
  final String profilePicturePath;
  final double radius;
  const AvatarImage(
      {super.key, required this.profilePicturePath, this.radius = 50});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: MyColorScheme.secondaryColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Image.asset(
          profilePicturePath,
          // width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
