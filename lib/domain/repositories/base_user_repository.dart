import '../entities/user_entity.dart';

abstract class BaseUserRepository {
  Future<List<UserEntity>> getSuggestedUsersByLogin(String login);
  Future<UserEntity?> getUserByUserId(String userId);
}
