
import 'package:cloud_firestore/cloud_firestore.dart';

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
  Map<String,dynamic> toMap({bool excludeId = false}){
    final map = {
      "content": content,
      "title": title,
      "createdAt": createdAt,
      "lastModifiedAt": lastModifiedAt,
      "isPinned": isPinned,
      "userId": userId,
    };
    if(excludeId==false) map['id'] = id;
    return map;
  }

  static NoteModel fromMap(Map<String,dynamic> map){
    return NoteModel(
      id: map['id'],
      content: map['content'],
      title: map['title'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      lastModifiedAt: (map['lastModifiedAt'] as Timestamp).toDate(),
      isPinned: map['isPinned'],
      userId: map['userId'],
    );
  }

  NoteModel copyWith({
    String? id,
    String? content,
    String? title,
    DateTime? createdAt,
    DateTime? lastModifiedAt,
    bool? isPinned,
    String? userId}){
    return NoteModel(
      id: id??this.id,
      content: content??this.content,
      title: title??this.title,
      createdAt: createdAt??this.createdAt,
      lastModifiedAt: lastModifiedAt??this.lastModifiedAt,
      isPinned: isPinned??this.isPinned,
      userId: userId??this.userId,
    );
  }

  @override
  String toString() {
    return 'NoteModel{id: $id, content: $content, title: $title, createdAt: $createdAt, lastModifiedAt: $lastModifiedAt, isPinned: $isPinned, userId: $userId}';
  }
}

// service -> db Model -> map
// db - service map -> Model
