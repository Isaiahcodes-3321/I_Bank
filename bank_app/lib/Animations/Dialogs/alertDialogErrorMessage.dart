import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constant/Themes.dart';


class ShowDialogERRORINPUT extends StatelessWidget {
  const ShowDialogERRORINPUT({super.key});

  @override
  Widget build(BuildContext context) {
     return BasicDialogAlert(
      title: FittedBox(
        child: Text("Transfer Failed",
            style: textStyle.copyWith(
                fontSize: 23.sp, color: Color.fromRGBO(255, 0, 0, 1))),
      ),
      content: Text(
            'Please fill all inputs correctly',
            style: TextStyle(color: Color.fromRGBO(155, 1, 1, 1)),
          ),
      actions: <Widget>[
        BasicDialogAction(
          title: Text("OK", style: textStyle.copyWith(fontSize: 18.sp,color: Color.fromRGBO(11, 172, 0, 1))),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}