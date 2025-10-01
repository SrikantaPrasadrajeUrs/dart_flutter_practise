
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/user_model.dart';

class UserService{
  final database = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get users => database.collection("users");

  void addOrUpdateUser(String uid, {bool isBiometricEnabled = false})async{
    try{
      final DocumentReference docRef = users.doc(uid);
      final DocumentSnapshot snapshot = await docRef.get();
      if(snapshot.exists){
        // update
        await docRef.update({"isBiometricEnabled":isBiometricEnabled});
      }else {
        //add
        await users.doc(uid).set({
          "id": uid,
          "isBiometricEnabled": isBiometricEnabled,
        });
      }
    }catch(e){
      print("Error: $e");
    }
  }

  Future<UserModel?> getUserDataById(String uid)async{
    final documentSnapshot = await users.doc(uid).get();
    return UserModel(uid: documentSnapshot.data()!['id'], isBiometricEnabled: documentSnapshot.data()!['isBiometricEnabled']);
  }
}