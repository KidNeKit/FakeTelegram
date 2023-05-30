import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/base_user_repository.dart';
import '../remote/datasources/base_user_datasource.dart';

class UserRepository extends BaseUserRepository {
  final BaseUserDatasource _userDatasource;

  UserRepository(BaseUserDatasource userDatasource)
      : _userDatasource = userDatasource;

  @override
  Future<List<UserEntity>> getSuggestedUsersByLogin(String login) async =>
      await _userDatasource.getSuggestedUsersByLogin(login);

  @override
  Future<UserEntity?> getUserByUserId(String userId) async =>
      await _userDatasource.getUserByUserId(userId);
}
