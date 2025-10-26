import 'package:first_project/core/service/user_service.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/service/biometric_service.dart';
import '../core/service/local_storage_service.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  final BiometricService bioMetricService = BiometricService();
  // AnimationController
  // Animation
 late AnimationController controller;
 late Animation<Offset> animation;



  @override
  void initState() {
    super.initState();
    // forward() 0-1
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<Offset>(begin: Offset.zero, end: Offset(2, 0)).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn)
    );
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      final String? uid = await LocalStorageService().getUserId();
      if(uid!=null){
        final userData = await UserService().getUserDataById(uid);
        if(userData!=null&& userData.isBiometricEnabled) {
          final isAuthenticated = await bioMetricService.authenticate();
          if(isAuthenticated){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(userModel: userData)));
          }
        }
      }
    });
  }

  void navigateToLogin(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login(email: '',)));
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final style1 = GoogleFonts.arima(
      fontSize: 26,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );
    final style2 = GoogleFonts.arima(
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 2),
                  borderRadius: BorderRadius.circular(185),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .1),
                      blurRadius: 7,
                      spreadRadius: 3
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(185),
                  child: Image.asset(
                    "assets/images/welcome_image.jpg",
                    height: 370,
                    fit: BoxFit.fill,
                  ),
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
              AnimatedOpacity(
                opacity: isVisible?1:0,
                duration: const Duration(seconds: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      backgroundColor: Colors.indigoAccent,
                      text: "Register",
                      textStyle: TextStyle(color: Colors.white, fontSize: 14),
                      onPressed: () {

                      },
                    ),
                    Button(
                      backgroundColor: Colors.white,
                      text: "Sign in",
                      textStyle: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 14,
                      ),
                      onPressed: navigateToLogin,
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (context,_) {
                  return SlideTransition(
                    position: animation,
                    child: GestureDetector(
                      onTap: (){
                        if(controller.isCompleted){
                          setState(() {
                            isVisible = false;
                          });
                          controller.reverse().then((_)=>controller.reset());
                        }else {
                          setState(() {
                            isVisible = true;
                          });
                          controller.forward();
                        }
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
