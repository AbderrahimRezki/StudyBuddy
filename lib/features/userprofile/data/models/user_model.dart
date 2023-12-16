import 'package:floor/floor.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';

@Entity(tableName: "user", primaryKeys: ["id"])
class UserModel extends UserEntity {
  @PrimaryKey(autoGenerate: true)
  int id;

  UserModel(
      {required this.id,
      required super.nickName,
      required super.profilePicturePath,
      required super.progress})
      : super(userId: id);

  factory UserModel.fromJSON(Map<String, dynamic> map) {
    return UserModel(
        id: map["userId"],
        nickName: map["nickname"] ?? "guest",
        profilePicturePath: map["profilePicturePath"] ?? "",
        progress: map["progress"]);
  }
}
