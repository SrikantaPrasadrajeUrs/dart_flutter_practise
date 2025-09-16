import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/screens/register.dart';
import 'package:first_project/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/service/biometric_service.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final BiometricService bioMetricService = BiometricService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      final isAuthenticated = await bioMetricService.authenticate();
      if(isAuthenticated){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final style1 = GoogleFonts.ptSans(
      fontSize: 26,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );
    final style2 = GoogleFonts.ptSans(
      fontSize: 16,
      color: Colors.grey.shade600,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.asset(
                  "assets/images/notes.jpg",
                  height: 370,
                  fit: BoxFit.fill,
                ),
              ),
              Spacer(),
              Text("Transform Speech into", style: style1),
              Text("Text Effortlessly", style: style1),
              SizedBox(height: 20),
              Text("Capture every detail with Record Notes.", style: style2),
              Text(
                "Record conversations, lectures, meetings, and",
                style: style2,
              ),
              Text("more, and watch as they are transcribed", style: style2),
              Text("accurate text. Instantly", style: style2),
              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    backgroundColor: Colors.indigoAccent,
                    text: "Register",
                    textStyle: TextStyle(color: Colors.white, fontSize: 14),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                  ),
                  Button(
                    backgroundColor: Colors.white,
                    text: "Sign in",
                    textStyle: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
