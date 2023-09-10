import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constant/Themes.dart';
import '../../Model/receiverDetails.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var textstyle = textStyle.copyWith(
        fontSize: 20.sp, color: Color.fromRGBO(31, 0, 17, 1));
    return AlertDialog(
      title: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            Icon(Icons.gpp_good_outlined, color: Colors.green, size: 41.sp),
            SizedBox(height: 5.h),
            Text("Transfer Successful!",
                style: textStyle.copyWith(
                    fontSize: 23.sp, color: Color.fromRGBO(31, 0, 17, 1))),
          ],
        ),
      ),
      // getting the current Transaction details from Providder state management
      content: Consumer<ReceiverDetails>(builder: (context, model, child) {
        try {
          var money = model.sendMoney;
          var receiverName = model.receiverName;
          return Column(
            children: [
              SizedBox(height: 5.h),
              Text(
                '\u20A6$money',
                style: TextStyle(fontSize: 23.sp),
              ),
              SizedBox(height: 3.h),
              Text(
                'Have been sent to $receiverName',
                style: textstyle.copyWith(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.h),
              Consumer<DateAndTime>(builder: (context, model, child) {
                var date = model.date;
                return Text("Date  $date",
                    style: textstyle.copyWith(
                      fontSize: 18.sp,
                      decoration: TextDecoration.underline,
                      decorationThickness: 10.sp,
                      decorationStyle: TextDecorationStyle.wavy,
                      
                    ));
              })
            ],
          );
        } catch (e) {
          print("Error in Consumer: $e");
          return Text("Error occurred");
        }
      }),
      actions: <Widget>[
        BasicDialogAction(
          title: Text("OK", style: textStyle.copyWith(fontSize: 20.sp)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
