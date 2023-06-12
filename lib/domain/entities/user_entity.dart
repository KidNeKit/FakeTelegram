import 'dart:convert';

class UserEntity {
  String? _userId;
  String? _phoneNumber;
  String? _login;
  String _name;
  String? _surname;
  String? _about;
  //String? userPhoto;

  UserEntity({
    String? userId,
    required String phoneNumber,
    required String login,
    required String name,
    String? surname,
    String? about,
  })  : _userId = userId,
        _login = login,
        _phoneNumber = phoneNumber,
        _name = name,
        _surname = surname,
        _about = about;

  UserEntity.preview(
      {required String name, required String userId, String? surname})
      : _userId = userId,
        _name = name,
        _surname = surname;

  factory UserEntity.fromJson(Map<String, dynamic> map) => UserEntity(
        userId: map['userId'],
        phoneNumber: map['phoneNumber'],
        login: map['login'],
        name: map['name'],
        surname: map['surname'],
        about: map['about'],
      );

  String? get userId => _userId;
  String? get phoneNumber => _phoneNumber;
  String? get login => _login;
  String? get name => _name;

  Map<String, dynamic> toJson() => {
        'userId': _userId,
        'name': _name,
        'surname': _surname,
        'about': _about,
        'phoneNumber': _phoneNumber,
        'login': _login,
      };

  Map<String, dynamic> toPreviewJson() => {
        'userId': _userId,
        'name': _name,
        'surname': _surname,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
