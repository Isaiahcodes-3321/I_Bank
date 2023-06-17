import 'dart:async';

import 'package:bankingapp/splashingPage/loginPage.dart';
import 'package:flutter/material.dart';

class Logo_page extends StatefulWidget {
  const Logo_page({super.key});

  @override
  State<Logo_page> createState() => _Logo_pageState();
}

class _Logo_pageState extends State<Logo_page> {
 Timer? _timer;

  // start the timer
  void initState() {
      _timer = Timer(Duration(seconds: 10), navigateTonextPage);

  }

  // I override the dispose method to cancel the timer
  void dispose() {
    // Cancel the timer if it is not null
    _timer?.cancel();
    super.dispose();
  }

  //method to navigate to the second page
  void navigateTonextPage() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login_Page()),

    );
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