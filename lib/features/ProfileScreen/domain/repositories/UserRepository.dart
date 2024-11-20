
import '../../../1_login/data/user_model.dart';

abstract class UserRepository {
  Future<void> createUser(UserModel  user);
  Future<void> addUser(UserModel  user);
  Future<UserModel ?> getUser(int userId);
  Future<void> updateUser(UserModel  user);
  Future<void> deleteUser(int userId);
  Future<List<UserModel >> getAllUsers();
}
