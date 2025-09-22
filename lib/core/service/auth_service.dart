import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // whenever we want to prevent the access of data from outside the class we use _
  final _auth = FirebaseAuth.instance;

  Future<void> createUser(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print("Error: $e");
      return null;
    }
  }
}