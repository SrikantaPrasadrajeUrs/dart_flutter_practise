import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // whenever we want to prevent the access of data from outside the class we use _
  final _auth = FirebaseAuth.instance;

  Future<void> createUser(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<bool> signIn(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(e){
      return false;
    }
  }


}