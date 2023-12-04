import 'package:flutter/material.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/core/utils/duration_formatter.dart';

class CircularTimer extends StatelessWidget {
  final Duration remainingTime;
  final Duration totalTime;
  final double strokeWidth;
  final Color fillColor;
  final double dimension;

  const CircularTimer(
      {super.key,
      required this.remainingTime,
      this.totalTime = const Duration(minutes: 30),
      required this.fillColor,
      this.strokeWidth = 5,
      this.dimension = 100});

  @override
  Widget build(BuildContext context) {
    final double progress = remainingTime.inSeconds / totalTime.inSeconds;
    return Stack(alignment: Alignment.center, children: [
      SizedBox.square(
        dimension: dimension,
        child: CircularProgressIndicator(
            value: progress, strokeWidth: strokeWidth, color: fillColor),
      ),
      Text(
        durationToString(remainingTime),
        style: boldTextStyle.copyWith(fontSize: 32),
      )
    ]);
  }
}
