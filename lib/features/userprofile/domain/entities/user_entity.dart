class UserEntity {
  final int userId;
  final String nickName;
  final String profilePicturePath;
  final int progress;

  const UserEntity(
      {required this.userId,
      required this.nickName,
      required this.profilePicturePath,
      required this.progress});
}
