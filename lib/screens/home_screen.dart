import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final instance = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get notes => instance.collection("notes");

  Stream<List> getNotes(){
    // map -> Iterable - Modify each element
    return notes.snapshots().map(
            (snapshot)=>snapshot.docs.map((doc){
              return doc.data();// Map -> key:value
            }).toList()
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void deleteNote(String noteId)async{
    await notes.doc(noteId).delete();
  }

  // flutter -> db
  void addNote(String title, String content){

  }

  void showPop(){
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
                )
              ],
            ),
          )
    ).whenComplete((){
      print(titleController.text);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Notes app"),
      ),
      body: StreamBuilder<List>(
          stream: getNotes(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.length, // list
                  itemBuilder: (context, index){
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
                        onLongPress: (){
                          // snapshot.data list -> index -note .id
                          deleteNote(snapshot.data![index]['id']);
                        },
                        title: Text(snapshot.data![index]["title"]),
                        subtitle: Text(snapshot.data![index]["content"]),
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