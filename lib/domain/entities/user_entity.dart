class UserEntity {
  String? _userId;
  String _phoneNumber;
  String _login;
  String _username;
  //String userPhoto;

  UserEntity(
      {String? userId,
      required String phoneNumber,
      required String login,
      required String username})
      : _userId = userId,
        _login = login,
        _phoneNumber = phoneNumber,
        _username = username;

  factory UserEntity.fromJson(Map<String, dynamic> map) => UserEntity(
        userId: map['userId'],
        phoneNumber: map['phoneNumber'],
        username: map['username'],
        login: map['login'],
      );

  String? get userId => _userId;
  String get phoneNumber => _phoneNumber;
  String get username => _username;
  String get login => _login;

  Map<String, dynamic> toJson() => {
        'userId': _userId,
        'username': _username,
        'phoneNumber': _phoneNumber,
        'login': _login,
      };
}
