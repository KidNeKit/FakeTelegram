import '../models/user_model.dart';

abstract class BaseUserDatasource {
  Future<List<UserModel>> getSuggestedUsersByLogin(String login);
  Future<UserModel?> getUserByUserId(String userId);
  Future<UserModel?> getUserByEmail(String email);

  Stream<UserModel?> get currentUser;
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}
