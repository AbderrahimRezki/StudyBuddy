import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/core/constants/dummy.dart';
import 'package:study_buddy/features/community/presentation/pages/community.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/login.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/welcome.dart';
import 'package:study_buddy/features/pomodoro/presentation/pages/pomodoro_timer.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';
import 'package:study_buddy/features/task/domain/entities/task_entity.dart';
import 'package:study_buddy/features/task/presentation/pages/add_task.dart';
import 'package:study_buddy/features/task/presentation/pages/list_tasks.dart';

class PageCubit extends Cubit<PageState> {
  final Map<String, Widget> pages = {
    StudyBuddyPage.pageRoute: const StudyBuddyPage(),
    NicknamePage.pageRoute: const NicknamePage(),
    TasksPage.pageRoute: const TasksPage(user: user),
    Pomodoro.pageRoute: const Pomodoro(),
    Community.pageRoute: const Community(),
  };

  PageCubit() : super(const PageInitialState());

  void changePage(String route) {
    emit(PageState(
        currentPage: pages[route]!,
        route: route,
        loggedInUser: state.loggedInUser));
  }

  void goToEditTaskPage(TaskEntity task) {
    emit(PageState(
        loggedInUser: state.loggedInUser,
        currentPage: AddTaskScreenState(task: task),
        route: AddTaskScreenState.pageRoute));
  }
}
