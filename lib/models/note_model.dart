
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
  // Model ->
  Map<String,dynamic> toMap(){
    return {
      "id": id,
      "content": content,
      "title": title,
      "createdAt": createdAt,
      "lastModifiedAt": lastModifiedAt,
      "isPinned": isPinned,
      "userId": userId,
    };
  }

  static NoteModel fromMap(Map<String,dynamic> map){
    return NoteModel(
      id: map['id'],
      content: map['content'],
      title: map['title'],
      createdAt: map['createdAt'],
      lastModifiedAt: map['lastModifiedAt'],
      isPinned: map['isPinned'],
      userId: map['userId'],
    );
  }
}

// service -> db Model -> map
// db - service map -> Model
