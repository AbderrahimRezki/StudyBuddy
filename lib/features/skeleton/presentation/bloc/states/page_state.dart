import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/core/constants/dummy.dart';
import 'package:study_buddy/features/community/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/presentation/pages/community.dart';
import 'package:study_buddy/features/pomodoro/presentation/pages/pomodoro_timer.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/welcome.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/login.dart';
import 'package:study_buddy/features/task/presentation/pages/list_tasks.dart';

class PageState extends Equatable {
  final UserEntity loggedInUser;
  final List<Widget> pages;
  final int index;

  const PageState(
      {required this.loggedInUser, required this.pages, this.index = 0});

  @override
  List<Object?> get props => [loggedInUser, pages, index];
}

class PageInitialState extends PageState {
  PageInitialState()
      : super(
            loggedInUser: user,
            pages: [
              const StudyBuddyPage(),
              const NicknamePage(),
              const TasksPage(user: user),
              const Pomodoro(),
              const Community()
            ],
            index: 0);
}
