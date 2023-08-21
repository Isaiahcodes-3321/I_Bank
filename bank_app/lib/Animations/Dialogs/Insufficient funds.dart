import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constant/Themes.dart';

class Insufficientfunds extends StatelessWidget {
  const Insufficientfunds({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicDialogAlert(
      title: Center(
        child: Text("Faild!",
            style: textStyle.copyWith(
                fontSize: 30.sp, color: Color.fromRGBO(31, 0, 17, 1))),
      ),
      // getting the current Transaction details from Providder state management
      content: Text("Insufficient funds. Please try again.", style: textStyle.copyWith(
                fontSize: 20.sp, color: Color.fromRGBO(7, 31, 0, 1))),
      actions: <Widget>[
        BasicDialogAction(
          title: Text("OK", style: textStyle.copyWith(fontSize: 18.sp)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}