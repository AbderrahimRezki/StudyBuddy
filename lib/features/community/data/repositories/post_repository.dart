import 'package:study_buddy/features/community/domain/entities/post_entity.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/features/community/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  @override
  Future<List<PostEntity>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      PostEntity(
          user: const UserEntity(
              userId: '0',
              nickName: "LHouma",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              userId: '1',
              nickName: "Samir",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
    ];
  }
}
