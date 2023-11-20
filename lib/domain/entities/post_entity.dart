import 'package:equatable/equatable.dart';
import 'package:study_buddy/domain/entities/user_entity.dart';

// ignore: must_be_immutable
class PostEntity extends Equatable {
  final UserEntity user;
  String description;
  int claps;

  PostEntity(
      {required this.user, required this.description, required this.claps});

  @override
  List<Object> get props => [user, description, claps];
}
