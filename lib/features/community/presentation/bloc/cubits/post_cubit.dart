import 'package:bloc/bloc.dart';
import 'package:study_buddy/features/community/domain/entities/post_entity.dart';
import 'package:study_buddy/features/community/presentation/bloc/states/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(PostEntity post) : super(PostState(post: post));

  void toggleClap() {
    if (state.post.isClapped) {
      removeClap();
      return;
    }

    addClap();
  }

  void addClap() {
    if (state.post.isClapped) return;

    state.post.claps++;
    state.post.isClapped = true;
    emit(PostState(post: state.post));
  }

  void removeClap() {
    if (!state.post.isClapped) return;

    state.post.claps--;
    state.post.isClapped = false;
    emit(PostState(post: state.post));
  }
}
