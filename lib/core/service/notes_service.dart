
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/note_model.dart';

class NotesService{
    final database = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> get notes => database.collection("notes");
    Stream<QuerySnapshot<Map<String, dynamic>>> getNotes(){
      return notes.snapshots();
    }

    void addNote(NoteModel note){
      notes.add(note.toMap());
    }

    void updateNote(NoteModel note){
      notes.doc(note.id).update(note.toMap());
    }

    void deleteNote(NoteModel note){
      notes.doc(note.id).delete();
    }
}