import 'package:first_project/core/service/notes_service.dart';
import '../models/note_model.dart';

class NotesRepo {
  final _notesService = NotesService();

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
    required String uid,
    required String title,
    required String content,
    required bool isPinned,
    required String userId
  }) {
    return _notesService.addNote(
      NoteModel(
        id: uid,
        content: content,
        title: title,
        createdAt: DateTime.now(),
        lastModifiedAt: DateTime.now(),
        isPinned: isPinned,
        userId: userId,
      ),
    );
  }

  void update({
    required NoteModel note
  }) {
    return _notesService.updateNote(note);
  }

  void delete({
    required NoteModel note
  }) {
    return _notesService.deleteNote(note);
  }
}
