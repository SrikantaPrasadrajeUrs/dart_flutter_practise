import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/note_model.dart';
import 'package:first_project/models/user_model.dart';
import 'package:first_project/repository/notes_repo.dart';
import 'package:flutter/material.dart';
import '../core/service/notes_service.dart';

class HomeScreen extends StatefulWidget {
  final UserModel userModel;
  const HomeScreen({super.key, required this.userModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
/// user specific data read
/// automatic login through fingerprint

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
    notesRepo.addNote(title: title, content: content, isPinned: isPinned, userId: widget.userModel.uid);
  }

  void updateNote(NoteModel noteModel){
    notesRepo.update(note:noteModel);
  }

  void deleteNote(NoteModel noteModel)=>notesRepo.delete(note: noteModel);

  void addOrUpdateNote({NoteModel? noteModel, String actionType = "ADD"}){
    titleController.text = noteModel?.title??"";
    contentController.text = noteModel?.content??"";
    bool isPinned = noteModel?.isPinned??false;
    showDialog(
        context: context,
        builder:(context)=>
            StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Text("$actionType note"),
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
                      Switch(
                        value: isPinned,
                        onChanged: (value){
                          setState(()=>isPinned = value);
                        },
                      ),
                      ElevatedButton(
                          onPressed: (){
                              if(actionType == "ADD"){
                                addNote(titleController.text, contentController.text, isPinned);
                              }else{
                                if(noteModel==null) return;
                                  noteModel = noteModel!.copyWith(title: titleController.text, content: contentController.text, isPinned: isPinned);
                                  updateNote(noteModel!);
                              }
                          },
                          child: Text(actionType)
                      )
                    ],
                  ),
                );
              }
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
          stream: notesRepo.getNotes(widget.userModel!.uid),
          builder: (context, snapshot){
            if(snapshot.hasData){
              /// [2,3,1,4,5] -> [1,2,3,4,5], [5,4,3,2,1]
              /// [false, true, false] -> [true, false, false]
              // [note, note] -> [note.isPinned, note.isPinned] -> [false, true] -> [true, false]
              snapshot.data!.sort((a,b){
                if(a.isPinned==true && b.isPinned==false){
                  return -1;
                }else if(a.isPinned==false && b.isPinned==true){
                  return 1;
                }
                return 0;
              });
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
                        onTap: ()=>addOrUpdateNote(noteModel: note, actionType: "UPDATE"),
                        onLongPress: (){
                          deleteNote(note);
                        },
                        title: Text(note.title),
                        subtitle: Text(note.content),
                        trailing: note.isPinned?Icon(Icons.pin_drop):null,
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
        onPressed: () => addOrUpdateNote(),
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