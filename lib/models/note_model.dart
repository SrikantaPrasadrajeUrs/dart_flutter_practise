
class NoteModel {
  final String id;
  final String content;
  final String title;
  final DateTime createdAt;
  final DateTime lastModifiedAt;
  final bool isPinned;
  final String userId;

  NoteModel({
    required this.id,
    required this.content,
    required this.title,
    required this.createdAt,
    required this.lastModifiedAt,
    required this.isPinned,
    required this.userId,
  });

}
