import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigoAccent
      ),
      home: const HomeScreen(),
    );
  }
}

// CRUD notes app
// firebase base data storing and accessing
// pinned

// Map -> entries()
// Set -> contains()