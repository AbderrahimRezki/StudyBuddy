import 'package:study_buddy/core/usecases/usecase.dart';
import 'package:study_buddy/features/community/domain/repositories/post_repository.dart';
import 'package:study_buddy/features/community/domain/entities/post_entity.dart';

class GetAllPostsUseCase implements UseCase<List<PostEntity>, void> {
  final PostRepository _postRepository;

  GetAllPostsUseCase(this._postRepository);

  @override
  Future<List<PostEntity>> call({params}) {
    return _postRepository.getAllPosts();
  }
}
