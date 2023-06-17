import 'package:bankingapp/screen/DashBoardPage/darshBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadAnimation extends StatefulWidget {
  LoadAnimation({super.key, required this.getUsername});
  final getUsername;
  @override
  State<LoadAnimation> createState() => _LoadAnimationState();
}

class _LoadAnimationState extends State<LoadAnimation> {
  
void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => 
        DashBoardscreeen(getUsername: widget.getUsername,)
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(0, 252, 252, 252),
      content: Container(
        height: 200,
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
