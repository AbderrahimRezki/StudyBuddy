import 'package:study_buddy/features/community/domain/entities/post_entity.dart';

abstract class IPostRepository {
  Future<List<PostEntity>> getAllPosts();
}
