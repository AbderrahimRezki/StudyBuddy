import 'package:study_buddy/domain/entities/post_entity.dart';

import '../../core/usecases/usecase.dart';
import '../respositories/post_repository.dart';

class GetAllPostsUseCaseImpl implements UseCase<List<PostEntity>, void> {
  final IPostRepository _postRepository;

  GetAllPostsUseCaseImpl(this._postRepository);

  @override
  Future<List<PostEntity>> call(void params) {
    return _postRepository.getAllPosts();
  }
}
