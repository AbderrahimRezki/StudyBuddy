import 'package:equatable/equatable.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';

// ignore: must_be_immutable
class UserState extends Equatable {
  UserEntity? loggedInUser;
  UserState({this.loggedInUser});

  @override
  List<Object?> get props => [loggedInUser];
}
