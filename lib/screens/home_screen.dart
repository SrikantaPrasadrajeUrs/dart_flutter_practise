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
              return doc.data()..['id'] = doc.id;// Map -> key:value
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
    print("title: $title, content: $content");
    ///content
    // "Given a signed 32-bit integer x, return x with its digit"
    // (string)
    //
    //
    // createdAt
    // 14 August 2025 at 22:29:25 UTC+5:30
    // (timestamp)
    //
    //
    // id
    // "zt3E0EtGoBo4iMaHmiJo"
    // (string)
    //
    //
    // isPinned
    // false
    // (Boolean)
    //
    //
    // lastModifiedAt
    // 27 August 2025 at 00:00:00 UTC+5:30
    // (timestamp)
    //
    //
    // title
    // "Second note"
    // (string)
    //
    //
    // userId
    // "EsU9yqVK5TSYs0xCWpTL7DeQJke2"
    notes.add({
      "title": title,
      "content": content,
      "createdAt": DateTime.now(),
      "lastModifiedAt": DateTime.now(),
      "isPinned": false,
      "userId": "EsU9yqVK5TSYs0xCWpTL7DeQJke2"
    });
    Navigator.pop(context);
  }

  void updateNote(String id, String title, String content){
      notes.doc(id).update({
        "title": title,
        "content": content,
        "createdAt": DateTime.now(),
        "lastModifiedAt": DateTime.now(),
        "isPinned": false,
        "userId": "EsU9yqVK5TSYs0xCWpTL7DeQJke2",
      });
  }

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
                        updateNote(noteId, titleController.text, contentController.text);
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
                      addNote(titleController.text, contentController.text);
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
                        onTap: (){
                          showPopUpdate(snapshot.data![index]['id'], snapshot.data![index]["title"], snapshot.data![index]["content"]);
                        },
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