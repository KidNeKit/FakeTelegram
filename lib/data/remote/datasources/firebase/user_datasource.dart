import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../remote_constants.dart';
import '../../models/user_model.dart';
import '../base_user_datasource.dart';

class UserDatasource extends BaseUserDatasource {
  final FirebaseFirestore _firestore;

  UserDatasource(FirebaseFirestore firestore) : _firestore = firestore;

  @override
  Future<List<UserModel>> getSuggestedUsersByLogin(String login) async {
    var users = await _firestore
        .collection(firebaseUsersPath)
        .where('login', isGreaterThanOrEqualTo: login)
        .get();
    return users.docs.map((user) => UserModel.fromJson(user.data())).toList();
  }

  @override
  Future<UserModel?> getUserByUserId(String userId) async {
    var userData =
        await _firestore.collection(firebaseUsersPath).doc(userId).get();
    return userData.exists ? UserModel.fromJson(userData.data()!) : null;
  }
}
