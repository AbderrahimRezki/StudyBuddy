import 'package:study_buddy/domain/entities/post_entity.dart';
import 'package:study_buddy/domain/entities/user_entity.dart';
import 'package:study_buddy/domain/respositories/post_repository.dart';

class PostRepository implements IPostRepository {
  @override
  Future<List<PostEntity>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 5));
    return [
      PostEntity(
          user: const UserEntity(
              nickName: "Karim",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Samir",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Kamal",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Amir",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Ayoub",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Houssem",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Anis",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Idriss",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Karim",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100),
      PostEntity(
          user: const UserEntity(
              nickName: "Karim",
              profilePicturePath: "assets/images/male.png",
              progress: 97),
          description:
              "Natus error voluptate quod beatae rem veniam sunt. Quibusdam eius nesciunt voluptatibus eius laborum officia quos sequi est. Dolores voluptates cum quos quibusdam odit rerum corporis ullam. Minus est quae rerum nihil. Officiis vel placeat. Explicabo illo natus sed quia sint minus ab.",
          claps: 100)
    ];
  }
}
