class UserModel {
  final String id;
  final String email;
  final String userName;

  const UserModel({
    required this.id,
    required this.email,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "userName": userName,
    };
  }
}
