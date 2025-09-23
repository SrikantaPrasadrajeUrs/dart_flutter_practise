import 'package:first_project/core/service/notes_service.dart';
import '../models/note_model.dart';

class NotesRepo {
  final NotesService _notesService;

  NotesRepo({required NotesService notesService}):_notesService=notesService;

  Stream<List<NoteModel>>? getNotes(String userId) {
    return _notesService.getNotes().map(
      (snapshot) =>
          snapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data();
            data["id"] = doc.id;
            return NoteModel.fromMap(data);
          }).where((note)=>note.userId==userId).toList(),
    );
  }
  //fruits = [apple, banana, orange] => [apple, orange] where((fruit)=>fruit!="banana")

  void addNote({
    required String title,
    required String content,
    required bool isPinned,
    required String userId
  }) async{
    NoteModel note = NoteModel(
      id: '',
      content: content,
      title: title,
      createdAt: DateTime.now(),
      lastModifiedAt: DateTime.now(),
      isPinned: isPinned,
      userId: userId,
    );
    await _notesService.addNote(note.toMap(excludeId: true));
  }

  void update({
    required NoteModel note
  }) {
    return _notesService.updateNote(note.id,note.toMap());
  }

  void delete({
    required NoteModel note
  }) {
    return _notesService.deleteNote(note.id);
  }
}
