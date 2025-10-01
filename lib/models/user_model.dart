class UserModel{
  final String uid;
  final bool isBiometricEnabled;

  UserModel({
    required this.uid,
    required this.isBiometricEnabled,
  });

  @override
  String toString() {
    return "isBiometricEnabled: $isBiometricEnabled, uid: $uid";
  }
}