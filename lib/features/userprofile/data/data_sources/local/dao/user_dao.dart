import 'package:floor/floor.dart';
import 'package:study_buddy/features/userprofile/data/models/user_model.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> addUser(UserModel user);

  @delete
  Future<void> deleteUser(UserModel user);
}
