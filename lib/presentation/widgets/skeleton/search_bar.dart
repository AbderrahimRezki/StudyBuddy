import 'package:flutter/material.dart';
import 'package:study_buddy/core/theme/theme.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SearchBar(
        padding: MaterialStateProperty.all(
            const EdgeInsets.only(left: 20, right: 20)),
        hintText: "Type something...",
        hintStyle: MaterialStatePropertyAll(hintTextStyle),
        elevation: MaterialStateProperty.all(1),
        trailing: const [Icon(Icons.search)],
      ),
    );
  }
}
