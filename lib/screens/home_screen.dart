import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/note_model.dart';
import 'package:first_project/repository/notes_repo.dart';
import 'package:flutter/material.dart';

import '../core/service/notes_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final NotesRepo notesRepo;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final instance = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get notes => instance.collection("notes");

  @override
  void initState() {
    super.initState();
    notesRepo = NotesRepo(notesService: NotesService());
  }

  void addNote(String title, String content, bool isPinned){
    notesRepo.addNote(title: title, content: content, isPinned: isPinned, userId: '');
  }

  void updateNote(){}

  void deleteNote(){}

  void showPopUpdate(String noteId, String title, String content){
    titleController.text = title;
    contentController.text = content;
    showDialog(
        context: context,
        builder:(context)=>
            AlertDialog(
              title: const Text("Update note"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter title"
                    ),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter content"
                    ),
                    controller: contentController,
                  ),
                  ElevatedButton(
                      onPressed: (){
                        updateNote(titleController.text, contentController.text, isPinned);
                      },
                      child: Text("Update")
                  )
                ],
              ),
            )
    );
  }

  void showPop(){
    titleController.clear();
    contentController.clear();
    showDialog(
      context: context,
      builder:(context)=>
          AlertDialog(
            title: const Text("Add note"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter title"
                  ),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter content"
                  ),
                  controller: contentController,
                ),
                ElevatedButton(
                    onPressed: (){
                      addNote(titleController.text, contentController.text, );
                    },
                    child: Text("Add")
                )
              ],
            ),
          )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Notes app"),
      ),
      body: StreamBuilder<List<NoteModel>>(
          stream: _notesRepo.getNotes(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.length, // list
                  itemBuilder: (context, index){
                    NoteModel note = snapshot.data![index];
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .1),
                            blurRadius: 1,
                            spreadRadius: 2
                          )
                        ]
                      ),
                      child: ListTile(
                        onTap: (){
                          showPopUpdate(note.id, note.title, note.content);
                        },
                        onLongPress: (){
                          deleteNote(note.id);
                        },
                        title: Text(note.title),
                        subtitle: Text(note.content),
                      ),
                    );
                  }
              );
            }
            return SizedBox();
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showPop();
        },
        child: Icon(Icons.add, color: Colors.black.withValues(alpha: .5)),
      )
    );
  }
}

// C R U D


///
/// List -> map method, forEach method, where method
/// ?? ??= ! , variable?.data, spread operator, ...?List
///
///

/// Login register
/// biometric authentication
/// image update, camera access
/// supabase - base
/// animations