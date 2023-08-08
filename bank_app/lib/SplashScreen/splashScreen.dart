import 'dart:async';
import 'package:flutter/material.dart';
import '../Screen/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

Timer? _timer;

  // start the timer
  void initState() {
      _timer = Timer(const Duration(seconds: 3), () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login_Page()),
    ));
  }

  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SizedBox(height: double.infinity, width: double.infinity,
      child: Container( color: Color.fromRGBO(101, 0, 56, 1.0),
        child: Center(child: Image.asset("images/logo.png")),)),
    );
  }
}