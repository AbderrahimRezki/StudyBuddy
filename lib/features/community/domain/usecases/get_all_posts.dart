import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/community/domain/respositories/post_repository.dart';
import 'package:study_buddy/features/community/domain/entities/post_entity.dart';

class GetAllPostsUseCaseImpl implements UseCase<List<PostEntity>, void> {
  final IPostRepository _postRepository;

  GetAllPostsUseCaseImpl(this._postRepository);

  @override
  Future<List<PostEntity>> call(void params) {
    return _postRepository.getAllPosts();
  }
}
