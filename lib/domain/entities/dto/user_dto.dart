class UserDTO {
  final String _userId;
  //final String userPhoto;

  const UserDTO({required String userId}) : _userId = userId;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      UserDTO(userId: json['userId']);

  Map<String, dynamic> toJson() => {
        'userId': _userId,
      };

  @override
  String toString() => toJson().toString();
}
