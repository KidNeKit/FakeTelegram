import '../models/user_model.dart';

abstract class BaseUserDatasource {
  Future<List<UserModel>> getSuggestedUsersByLogin(String login);
  Future<UserModel?> getUserByUserId(String userId);
}
