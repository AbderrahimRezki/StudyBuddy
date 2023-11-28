import 'package:study_buddy/domain/entities/post_entity.dart';

abstract class IPostRepository {
  Future<List<PostEntity>> getAllPosts();
}
