import 'package:first_project/core/service/notes_service.dart';
import '../models/note_model.dart';

class NotesRepo {
  final NotesService _notesService;

  NotesRepo({required NotesService notesService}):_notesService=notesService;

  Stream<List<NoteModel>> getNotes() {
    return _notesService.getNotes().map(
      (snapshot) =>
          snapshot.docs.map((doc) {
            doc.data()['id'] = doc.id;
            return NoteModel.fromMap(doc.data());
          }).toList(),
    );
  }

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
