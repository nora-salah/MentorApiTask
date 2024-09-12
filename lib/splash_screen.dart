import 'package:flutter/material.dart';
import 'package:mentor_api_task/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "MENTOR",
                style: TextStyle(
                    fontSize: 70,
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "  A c A D E M Y ",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
