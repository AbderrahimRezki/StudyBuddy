import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/domain/entities/navigation_item_entity.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int selectedIndex = 0;
  final List<NavigationBarItemEntity> navigationBarItems = [
    const NavigationBarItemEntity(
        iconPath: "assets/icons/tasks.svg", itemTitle: "Tasks", route: "/add"),
    const NavigationBarItemEntity(
        iconPath: "assets/icons/timer.svg",
        itemTitle: "Timer",
        route: "/timer"),
    const NavigationBarItemEntity(
        iconPath: "assets/icons/people.svg",
        itemTitle: "People",
        route: "/community")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
      height: 100,
      decoration: BoxDecoration(gradient: linearGradient()),
      child: Material(
        color: MyColorScheme.white,
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (int index = 0; index < navigationBarItems.length; index++)
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(navigationBarItems[index].route);

                  selectedIndex = index;
                  setState(() {});
                },
                child: NavigationBarItem(
                    navigationBarItem: navigationBarItems[index],
                    isSelected: index == selectedIndex),
              )
          ]),
        ),
      ),
    );
  }

  LinearGradient linearGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          MyColorScheme.textColor.withAlpha(0),
          MyColorScheme.textColor.withAlpha(100)
        ]);
  }
}

class NavigationBarItem extends StatelessWidget {
  final NavigationBarItemEntity navigationBarItem;
  final bool isSelected;
  const NavigationBarItem(
      {super.key, required this.navigationBarItem, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final Color iconColor =
        isSelected ? MyColorScheme.primaryColor : MyColorScheme.textColor;

    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
          color: isSelected
              ? MyColorScheme.selectedIconBackground
              : MyColorScheme.white,
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          SvgPicture.asset(
            navigationBarItem.iconPath,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          const SizedBox(
            width: 5,
          ),
          if (isSelected)
            Text(
              navigationBarItem.itemTitle,
              style: boldTextStyle.copyWith(color: MyColorScheme.primaryColor),
            )
        ],
      ),
    );
  }
}
