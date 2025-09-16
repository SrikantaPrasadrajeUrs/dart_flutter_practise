
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesService{
    final database = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> get notes => database.collection("notes");
    Stream<QuerySnapshot<Map<String, dynamic>>> getNotes(){
      return notes.snapshots();
    }

    Future<void> addNote(Map<String,dynamic> note)async{
      await notes.add(note);
    }

    void updateNote(String noteId, Map<String,dynamic> note){
      notes.doc(noteId).update(note);
    }

    void deleteNote(String noteId){
      notes.doc(noteId).delete();
    }
}