import 'dart:async';
import '../loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/widgets/Themes.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  // start the timer
  @override
  void initState() {
    super.initState();
   
    _timer = Timer(
        const Duration(seconds: 1),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ));
  }



  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Container(
            color: appBackgroundColor,
            child: Center(child: Image.asset("images/IbankLogo.PNG")),
          )),
    
    );
  }
}

