import '../../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.login,
    required super.phoneNumber,
    required super.name,
    super.surname,
    super.userId,
    super.about,
  });

  UserModel.preview(
      {required String name, required String userId, String? surname})
      : super.preview(name: name, userId: userId, surname: surname);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      name: json['name'],
      surname: json['surname'],
      about: json['about'],
      phoneNumber: json['phoneNumber'],
      userId: json['userId'],
    );
  }
}
