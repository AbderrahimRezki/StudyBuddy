import 'package:study_buddy/features/community/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getAllPosts();
}
