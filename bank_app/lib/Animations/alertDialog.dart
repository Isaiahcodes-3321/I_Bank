import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Constant/Themes.dart';
import '../Model/receiverDetails.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicDialogAlert(
      title: FittedBox(
        child: Text("Tranfer Successful!",
            style: textStyle.copyWith(
                fontSize: 23.sp, color: Color.fromRGBO(31, 0, 17, 1))),
      ),
      content: Consumer<ReceiverDetails>(builder: (context, model, child) {
        try {
          var money = model.sendMoney;
          var receiverName = model.receiverName;
          var phonePhoneNumber = model.receiverPhoneNumber;


          return Text(
            'You sent \u20A6$money to $receiverName to this number $phonePhoneNumber',
            style: TextStyle(color: Color.fromRGBO(31, 0, 17, 1)),
          );
        } catch (e) {
          print("Error in Consumer: $e");
          return Text("Error occurred");
        }
      }),
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
