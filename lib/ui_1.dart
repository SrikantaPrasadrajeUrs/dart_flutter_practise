import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.grey.shade700),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: const Demo1(),
    );
  }
}

class Demo1 extends StatelessWidget {
  const Demo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        leading: Icon(Icons.watch),
        title: Text("fibit"),
        centerTitle: true,
        actions: [
          Icon(Icons.messenger_outline),
          SizedBox(width: 10),
          Icon(Icons.account_circle_rounded),
          SizedBox(width: 10),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny_snowing),
            label: "Today",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_outlined),
            label: "Coach",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp),
            label: "You",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.add_chart),
                    SizedBox(height: 60),
                    Text("Elisa Beckett", style: TextStyle(fontSize: 30)),
                    SizedBox(height: 10),
                    Row(children: [Text("Joined 2016 * "),
                      Text("Try fibit premium", style: TextStyle(color: Colors.blue))]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//           margin: EdgeInsets.only(left: 5, bottom: 5),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Icon(Icons.ac_unit),
//         ),
//         title: Text(
//           "Cool Company",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//         ),
//         actions: [
//           Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white, size: 30),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calender"),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           appBarTheme: AppBarTheme(color:  Colors.blue),
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           bottomNavigationBarTheme: BottomNavigationBarThemeData(
//               backgroundColor: Colors.white
//           )
//       ),
//       home: const Demo1(),
//     );
//   }
// }
//
// class Demo1 extends StatelessWidget {
//   const Demo1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         leading: Icon(Icons.account_circle_rounded),
//         title: Text("Cool Company"),
//         centerTitle: true,
//         actions: [
//           Icon(Icons.keyboard_arrow_down),
//           SizedBox(width: 10)
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ExpansionTile(
//                 expandedAlignment: Alignment.centerLeft,
//                 childrenPadding: EdgeInsets.all(10),
//                 tilePadding: EdgeInsets.all(5),
//                 title: Text("Team Marketing"),
//                 shape: RoundedRectangleBorder(),
//                 children:[
//                   Text("Branding"),
//                   Text("Content stuff"),
//                   Text("Digital"),
//                   Text("Public regulations"),
//                   Text("Seo activities"),
//                   Text("Social media"),
//                   Text("strategists"),
//                   Text("Flutter"),
//                 ]
//             ),
//             Divider(
//               color: Colors.green,
//             ),
//             Text("Unread"),
//             Row(
//               children: [
//                 Icon(Icons.account_circle_rounded),
//               ],
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.sunny_snowing),
//               label: "Today",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.sticky_note_2_outlined),
//               label: "Coach",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.ac_unit_sharp),
//               label: "You",
//             ),
//           ]),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//           margin: EdgeInsets.only(left: 5, bottom: 5),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Icon(Icons.ac_unit),
//         ),
//         title: Text(
//           "Cool Company",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//         ),
//         actions: [
//           Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white, size: 30),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calender"),
//         ],
//       ),
//     );
//   }
// }
