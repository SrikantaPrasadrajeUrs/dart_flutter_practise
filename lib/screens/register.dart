import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/repository/notes_repo.dart';
import 'package:first_project/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          children: [
            Spacer(
              flex: 3,
            ),
            Text("Create a account", style: GoogleFonts.quicksand(fontSize: 29, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have and account? ", style: GoogleFonts.quicksand(fontSize: 14, color: Colors.black87)),
                Text("Login", style: GoogleFonts.quicksand(fontSize: 14, color: Colors.indigoAccent))
              ],
            ),
            Spacer(),
            TextFormField(controller: emailController, decoration: InputDecoration(
              hintText: "Email address"
            ),),
            SizedBox(height: 30,),
            TextFormField(controller: passwordController, decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: Icon(Icons.remove_red_eye_outlined, color: Colors.black38,)
            )),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Recovery Password", style: GoogleFonts.quicksand(fontSize: 14, color: Colors.black38, fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: 20),
            Button(
              width: double.infinity,
              backgroundColor: Colors.indigoAccent,
              textStyle: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              text: "Continue",
              onPressed: ()=>authRepo.createUser(emailController.text, passwordController.text),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    endIndent: 10,
                  ),
                ),
                Text("or sign up with"),
                Expanded(
                  child: Divider(
                    indent: 10,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                    borderColor: Colors.grey.shade400,
                    width: 100,backgroundColor: Colors.white, textStyle: TextStyle(color: Colors.black), imagePath: "assets/images/welcome.jpg"),
                Button(borderColor: Colors.grey.shade400,width: 100,backgroundColor: Colors.white, textStyle: TextStyle(color: Colors.black), imagePath: "assets/images/welcome.jpg"),
                Button(borderColor: Colors.grey.shade400,width: 100,backgroundColor: Colors.white, textStyle: TextStyle(color: Colors.black), imagePath: "assets/images/welcome.jpg")
              ],
            ),
            Spacer(
              flex: 6,
            )
          ],
        ),
      ),
    );
  }
}
