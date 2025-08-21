import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/repository/notes_repo.dart';
import 'package:first_project/widgets/button.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthRepo authRepo = AuthRepo();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login()async{
    print(
      "email: ${emailController.text}, password: ${passwordController.text}",
    );
    final instance = FirebaseAuth.instance;
    final user = await instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    print("logged in successfully $user");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(controller: emailController),
            TextFormField(controller: passwordController),
            SizedBox(height: 20),
            Button(
              backgroundColor: Colors.indigo,
              textStyle: TextStyle(color: Colors.white),
              text: "Register",
              onPressed: ()=>authRepo.createUser(emailController.text, passwordController.text),
            ),
          ],
        ),
      ),
    );
  }
}
