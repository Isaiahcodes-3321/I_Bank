import 'package:flutter/material.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class Insufficientfunds extends StatelessWidget {
  const Insufficientfunds({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicDialogAlert(
      title: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Failed!",
                style: textStyle.copyWith(
                    fontSize: 30.sp, color: appBackgroundColor)),
            Icon(Icons.cancel_outlined, color: appBackgroundColor, size: 30.sp)
          ],
        ),
      ),
      // getting the current Transaction details from Provider state management
      content: Text("Insufficient funds. Please try again.",
          style: textStyle.copyWith(
              fontSize: 20.sp, color: deepPurpleColor),
          textAlign: TextAlign.center),
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
