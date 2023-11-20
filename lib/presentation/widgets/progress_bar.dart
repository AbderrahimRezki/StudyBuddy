import "package:flutter/material.dart";

class ProgressBar extends StatelessWidget {
  final double value;
  final double height;
  final Color foregroundColor;
  final Color backgroundColor;

  const ProgressBar(
      {Key? key,
      required this.value,
      this.height = 5,
      required this.foregroundColor,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FractionallySizedBox(
                widthFactor: value,
                child: Container(
                  decoration: BoxDecoration(color: foregroundColor),
                ))));
  }
}
