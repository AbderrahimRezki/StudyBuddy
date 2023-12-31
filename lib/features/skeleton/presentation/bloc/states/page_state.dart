import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/core/constants/dummy.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/presentation/pages/community.dart';
import 'package:study_buddy/features/pomodoro/presentation/pages/pomodoro_timer.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/welcome.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/login.dart';
import 'package:study_buddy/features/task/presentation/pages/list_tasks.dart';

class PageState extends Equatable {
  final UserEntity loggedInUser;
  final Map<String, Widget> pages;
  final String route;

  const PageState(
      {required this.loggedInUser,
      required this.pages,
      this.route = StudyBuddyPage.pageRoute});

  bool pageHasBars() {
    const noBars = [StudyBuddyPage.pageRoute, NicknamePage.pageRoute];

    return !noBars.contains(route);
  }

  @override
  List<Object?> get props => [loggedInUser, pages, route];
}

class PageInitialState extends PageState {
  PageInitialState()
      : super(
            loggedInUser: user,
            pages: {
              StudyBuddyPage.pageRoute: const StudyBuddyPage(),
              NicknamePage.pageRoute: const NicknamePage(),
              TasksPage.pageRoute: const TasksPage(user: user),
              Pomodoro.pageRoute: const Pomodoro(),
              Community.pageRoute: const Community()
            },
            route: StudyBuddyPage.pageRoute);
}
