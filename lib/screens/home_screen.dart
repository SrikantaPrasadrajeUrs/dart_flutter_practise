import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final instance = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get notes => instance.collection("notes");
  Stream<List> getNotes(){

    // map -> Iterable - Modify each element
    return notes.snapshots().map(
            (snapshot)=>snapshot.docs.map((doc){
              return doc.data();
            }).toList()
    );
  }

  void deleteNote(String noteId)async{
    await notes.doc(noteId).delete();
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
      )
    );
  }
}

// C R U D


///
/// List -> map method, forEach method, where method
/// ?? ??= ! , variable?.data, spread operator, ...?List