import 'package:bank_app/Screen/InbuiltScreens/History/normalListView.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Constant/Themes.dart';

import '../../../Storage/person.dart';
import 'animationListView.dart';

class HistoryTab extends StatelessWidget {
  HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reCeiverstorage = Hive.box<ReceiverStorage>('receiverBox');
    bool checkForData = reCeiverstorage.isNotEmpty; // Check if there's any data

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Transaction History",
                style: textStyle.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5.h,
            ),

            if (checkForData)
              if (reCeiverstorage.length > 5)
                AnimatedListview()
              else
                NormalListView()
            else
              Padding(
                padding: EdgeInsets.only(bottom: 15.h, top: 15.h),
                child: Center(
                    child: Column(
                  children: [
                    Icon(Icons.cancel_outlined,
                        color: backgroundColor, size: 40.sp),
                    FittedBox(
                      child: Text("No transactions were made.",
                          style: textStyle.copyWith(
                              fontSize: 30.sp, color: backgroundColor)),
                    )
                  ],
                )),
              ),
          ],
        ),
      ),
    );
  }
}
