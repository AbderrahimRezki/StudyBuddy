import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/community/presentation/pages/community.dart';
import 'package:study_buddy/features/pomodoro/presentation/pages/pomodoro_timer.dart';
import 'package:study_buddy/features/skeleton/domain/entities/navigation_item_entity.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';
import 'package:study_buddy/features/task/presentation/pages/list_tasks.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int selectedIndex = 0;
  final List<NavigationBarItemEntity> navigationBarItems = [
    const NavigationBarItemEntity(
        iconPath: "assets/icons/tasks.svg",
        itemTitle: "Tasks",
        route: TasksPage.pageRoute),
    const NavigationBarItemEntity(
        iconPath: "assets/icons/timer.svg",
        itemTitle: "Timer",
        route: Pomodoro.pageRoute),
    const NavigationBarItemEntity(
        iconPath: "assets/icons/people.svg",
        itemTitle: "People",
        route: Community.pageRoute)
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
          height: 100,
          decoration: BoxDecoration(gradient: linearGradient()),
          child: Material(
            color: MyColorScheme.white,
            borderRadius: BorderRadius.circular(50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int index = 0;
                        index < navigationBarItems.length;
                        index++)
                      GestureDetector(
                        onTap: () {
                          context
                              .read<PageCubit>()
                              .changePage(navigationBarItems[index].route);
                        },
                        child: NavigationBarItem(
                            navigationBarItem: navigationBarItems[index],
                            isSelected:
                                navigationBarItems[index].route == state.route),
                      )
                  ]),
            ),
          ),
        );
      },
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
