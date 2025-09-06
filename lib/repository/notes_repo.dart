
import 'package:first_project/core/service/notes_service.dart';

class NotesRepo{
  final _notesService = NotesService();

  Stream<List> getNotes(){
    return _notesService.getNotes().map(
            (snapshot)=>snapshot.docs.map((doc){
          return doc.data()..['id'] = doc.id;
        }).toList());
  }
}