import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String nickName;
  final String profilePicturePath;
  final int progress;

  const UserEntity(
      {required this.nickName,
      required this.profilePicturePath,
      required this.progress});

  @override
  List<Object> get props => [nickName, profilePicturePath];
}
