
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;

  Future<void> createUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}