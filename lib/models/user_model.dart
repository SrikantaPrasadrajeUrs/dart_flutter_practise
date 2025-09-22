class UserModel{
  final String uid;
  final String email;

  UserModel({
    required this.uid,
    required this.email,
  });

  @override
  String toString() {
    return "email: $email, uid: $uid";
  }
}