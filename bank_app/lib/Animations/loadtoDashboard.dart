import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Screen/dashBoard.dart';

class LoadDasboard extends StatefulWidget {
  const LoadDasboard({super.key});

  @override
  State<LoadDasboard> createState() => _LoadDasboardState();
}

class _LoadDasboardState extends State<LoadDasboard> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashBoardscreeen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(101, 0, 56, 1.0),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SpinKitWaveSpinner(
            color: Colors.white,
            size: 45.sp,
          ),
        ),
      ),
    );
  }
}
