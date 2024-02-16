import 'package:flutter/material.dart';
import '../screens/dashBoard/dashBoard.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class LoadDasboard extends StatefulWidget {
  const LoadDasboard({super.key});

  @override
  State<LoadDasboard> createState() => _LoadDasboardState();
}

class _LoadDasboardState extends State<LoadDasboard> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashBoardscreeen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appBackgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SpinKitWaveSpinner(
            color: whiteColor,
            size: 45.sp,
          ),
        ),
      ),
    );
  }
}
