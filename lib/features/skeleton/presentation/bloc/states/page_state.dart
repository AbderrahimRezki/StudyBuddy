import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/core/constants/dummy.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/welcome.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/login.dart';

class PageState extends Equatable {
  final UserEntity loggedInUser;
  final Widget currentPage;
  final String route;
  final dynamic params;

  const PageState(
      {required this.loggedInUser,
      required this.currentPage,
      required this.route,
      this.params});

  bool pageHasBars() {
    const noBars = [StudyBuddyPage.pageRoute, NicknamePage.pageRoute];
    return !noBars.contains(route);
  }

  @override
  List<Object?> get props => [loggedInUser, currentPage];
}

class PageInitialState extends PageState {
  const PageInitialState()
      : super(
          loggedInUser: user,
          route: StudyBuddyPage.pageRoute,
          currentPage: const StudyBuddyPage(),
        );
}
