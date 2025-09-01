import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/screens/welcome_screen.dart';
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
        colorSchemeSeed: Colors.indigoAccent,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
          )
        )
      ),
      home: const WelcomeScreen(),
    );
  }
}

// CRUD notes app
// firebase base data storing and accessing
// pinned

// Map -> entries()
// Set -> contains()