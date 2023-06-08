import '../entities/user_entity.dart';

abstract class BaseUserRepository {
  Future<List<UserEntity>> getSuggestedUsersByLogin(String login);
  Future<UserEntity?> getUserByUserId(String userId);
  Future<UserEntity?> getUserByEmail(String email);

  Stream<UserEntity?> get currentUser;
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}
