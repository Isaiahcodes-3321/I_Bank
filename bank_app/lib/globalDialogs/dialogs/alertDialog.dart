import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/receiverDetails.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var getTextStyle = textStyle.copyWith(
        fontSize: 20.sp, color: deepPurpleColor);
    return AlertDialog(
      title: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            Icon(Icons.gpp_good_outlined, color: grayColor, size: 41.sp),
            SizedBox(height: 5.h),
            Text("Transfer Successful!",
                style: textStyle.copyWith(
                    fontSize: 23.sp, color: deepPurpleColor)),
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
                style: getTextStyle.copyWith(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.h),
              Consumer<Date>(builder: (context, model, child) {
                var date = model.date;
                return Text("Date  $date",
                    style: getTextStyle.copyWith(
                      fontSize: 18.sp,
                      decoration: TextDecoration.underline,
                      decorationThickness: 5.sp,
                      decorationStyle: TextDecorationStyle.wavy,
                    ));
              })
            ],
          );
        } catch (e) {
          print("Error in Consumer: $e");
          return const Text("Error occurred");
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
