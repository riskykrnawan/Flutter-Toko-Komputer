import 'dart:async';
import 'package:flutter/material.dart';
import 'package:acul_komputer/screens/home/home_screen.dart';
import 'package:acul_komputer/screens/login/login_screen.dart';
import 'package:acul_komputer/screens/register/register_screen.dart';
import 'screens/main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashScreenStart();
    super.initState();
  }

  splashScreenStart() {
    const duration = Duration(seconds: 6);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          // return const MyMainScreen();
          return Login();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.4;
    var height = MediaQuery.of(context).size.width / 1.4;

    return Scaffold(
      backgroundColor: Color(0xFF2E394C),
      body: Center(
        child: Image.asset(
          "assets/images/splash_logo.png",
          width: width,
          height: height,
        ),
      ),
    );
  }
}
