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

  @override
  Stream<UserEntity?> get currentUser => _userDatasource.currentUser;

  @override
  Future<void> signInWithEmailAndPassword(
          String email, String password) async =>
      await _userDatasource.signInWithEmailAndPassword(email, password);

  @override
  Future<void> signOut() async => await _userDatasource.signOut();

  @override
  Future<void> signUpWithEmailAndPassword(
          String email, String password) async =>
      await _userDatasource.signUpWithEmailAndPassword(email, password);

  @override
  Future<UserEntity?> getUserByEmail(String email) async =>
      _userDatasource.getUserByEmail(email);
}
