import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitialState());

  void changePage(String route) {
    emit(PageState(
        pages: state.pages, route: route, loggedInUser: state.loggedInUser));
  }
}
