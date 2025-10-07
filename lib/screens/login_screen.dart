import 'package:first_project/core/service/auth_service.dart';
import 'package:first_project/core/service/local_storage_service.dart';
import 'package:first_project/core/service/user_service.dart';
import 'package:first_project/repository/auth_repo.dart';
import 'package:first_project/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class Login extends StatefulWidget {
  final String? email;
  final String? password;
  const Login({super.key, this.email, this.password});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthRepo authRepo = AuthRepo(authService: AuthService());
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.password);
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      final userdata = await authRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userdata != null) {
        showEnableBiometric(userdata.uid);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(userModel: userdata)));
      }
    }
  }

  void showEnableBiometric(String uid) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Enable biometric"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        UserService().addOrUpdateUser(
                          uid,
                          isBiometricEnabled: true,
                        );
                        LocalStorageService().storeUserId(uid);

                      },
                      child: Text("Enable"),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: Text("Disable")),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String? validate(String? str, {String fieldType = "email"}) {
    if (str == null || str.isEmpty) {
      return "$fieldType is required";
    }
    if (fieldType == "email") {
      if (!str.contains("@")) {
        return "Invalid $fieldType";
      }
    }
    if (fieldType == "password") {
      if (str.length < 6) {
        return "Password must be at least 6 characters";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              Text(
                "Sign in",
                style: GoogleFonts.quicksand(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have a account? ",
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Sign up",
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ],
              ),
              Spacer(),
              TextFormField(
                controller: emailController,
                validator: (str) => validate(str, fieldType: "email"),
                decoration: InputDecoration(hintText: "Email address"),
                autofocus: true,
                onFieldSubmitted: (_){
                  focusNode.requestFocus();
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                focusNode: focusNode,
                controller: passwordController,
                validator: (str) => validate(str, fieldType: "password"),
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: GestureDetector(
                    onTap: ()async{
                      if(obscurePassword){
                        setState(() => obscurePassword=false);
                        Future.delayed(Duration(seconds: 2),()=>setState(() => obscurePassword=true));
                      }
                    },
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Recovery Password",
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Button(
                width: double.infinity,
                backgroundColor: Colors.indigoAccent,
                textStyle: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                text: "Continue",
                onPressed: login,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey, endIndent: 10)),
                  Text("or sign up with"),
                  Expanded(child: Divider(indent: 10, color: Colors.grey)),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    borderColor: Colors.grey.shade400,
                    width: 100,
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(color: Colors.black),
                    imagePath: "assets/images/google.png",
                  ),
                  Button(
                    borderColor: Colors.grey.shade400,
                    width: 100,
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(color: Colors.black),
                    imagePath: "assets/images/apple.png",
                  ),
                  Button(
                    borderColor: Colors.grey.shade400,
                    width: 100,
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(color: Colors.black),
                    imagePath: "assets/images/facebook.png",
                  ),
                ],
              ),
              Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}
