import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../remote_constants.dart';
import '../../models/user_model.dart';
import '../base_user_datasource.dart';

class UserDatasource extends BaseUserDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  UserDatasource(FirebaseFirestore firestore, FirebaseAuth firebaseAuth)
      : _firestore = firestore,
        _firebaseAuth = firebaseAuth;

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

  @override
  Stream<UserModel?> get currentUser =>
      _firebaseAuth.authStateChanges().asyncMap((user) async =>
          user == null ? null : await getUserByUserId(user.uid));

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => _firestore
              .collection('users')
              .doc(value.user!.uid)
              .set(UserModel(
                      login: value.user!.uid,
                      phoneNumber: email,
                      name: 'created_user',
                      userId: value.user!.uid)
                  .toJson()));
    } catch (e) {
      log('Registration error: $e');
      rethrow;
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log('Authorization error: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    var userData = await _firestore
        .collection(firebaseUsersPath)
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    return userData.size != 0
        ? userData.docs.map((e) => UserModel.fromJson(e.data())).first
        : null;
  }
}
