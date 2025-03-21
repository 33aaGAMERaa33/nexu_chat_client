interface class UserModel {
  final String uuid;
  final String username;
  final String email;

  UserModel({
    required this.uuid,
    required this.username,
    required this.email,
  });

  @override
  String toString() {
    return "uuid: $uuid | username: $username | email: $email";
  }
}