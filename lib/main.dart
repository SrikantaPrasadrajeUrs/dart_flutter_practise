import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // this widget will be diaplyed in ui
}

// Stateless and Stateful Widgets
// Android and ios
// Material design for android
// Cupertino design for ios

// if a class extends to either stateful or stateless widget then it is called widget

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigoAccent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle: TextStyle(color: Colors.black),
          )
      ),
      home: const Demo1(),
    );
  }
}

class Demo1 extends StatefulWidget {
  const Demo1({super.key});

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Icon(Icons.add_a_photo_outlined, size: 18),
        ),
        title: Text("Cool Company", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        actions: [
          Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,),
          SizedBox(width: 10)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.black,), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black,), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.black,), label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.share, color: Colors.black,), label: "Share"),
          ]
      ),
    );
  }
}

////Column(
//         children: [
//           ExpansionTile(
//               title: Text("Team Marketing"),
//               children:[
//                 Text("Branding"),
//                 Text("Content stuff"),
//                 Text("Digital"),
//                 Text("Public regulations"),
//                 Text("Seo activities"),
//                 Text("Social media"),
//                 Text("strategists"),
//                 Text("Flutter"),
//               ]
//           )
//         ],
//       )
