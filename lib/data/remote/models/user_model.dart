import '../../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.login,
      required super.username,
      required super.phoneNumber,
      super.userId});

  UserModel.nameWithAvatar({
    required String username,
  }) : super.nameWithAvatar(username: username);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      userId: json['userId'],
    );
  }
}
