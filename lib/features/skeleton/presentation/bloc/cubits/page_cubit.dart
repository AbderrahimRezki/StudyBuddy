import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitialState());

  void changePage(int index) {
    emit(PageState(
        pages: state.pages, index: index, loggedInUser: state.loggedInUser));
  }
}
