
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesService{
    final database = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> get notes => database.collection("notes");
    Stream<QuerySnapshot<Map<String, dynamic>>> getNotes(){
      return notes.snapshots();
    }
}