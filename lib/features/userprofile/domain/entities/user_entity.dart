class UserEntity {
  final String? userId;
  final String nickName;
  final String? profilePicturePath;
  final int progress;

  const UserEntity(
      {required this.userId,
      required this.nickName,
      required this.profilePicturePath,
      required this.progress});

  UserEntity copyWith(
      {String? userId,
      String? nickName,
      String? profilePicturePath,
      int? progress}) {
    return UserEntity(
        userId: userId ?? this.userId,
        nickName: nickName ?? this.nickName,
        profilePicturePath: profilePicturePath ?? this.profilePicturePath,
        progress: progress ?? this.progress);
  }

  factory UserEntity.fromJson(Map map) {
    return UserEntity(
        userId: map["id"],
        nickName: map["username"] ?? "Anonymous",
        profilePicturePath: map["avatar_url"],
        progress: map["progress"] ?? 0);
  }
}
