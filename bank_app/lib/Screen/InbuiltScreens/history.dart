import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Constant/Themes.dart';

import '../../Storage/person.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reCeiverstorage = Hive.box<ReceiverStorage>('receiverBox');

   return Scaffold(
  body: Padding(
    padding: EdgeInsets.all(20.sp),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: textStyle.copyWith(fontSize: 23.sp),
            children: [
              TextSpan(text: 'Transaction '),
              TextSpan(
                text: 'History',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: SingleChildScrollView( // Add SingleChildScrollView here
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: reCeiverstorage.length,
                  itemBuilder: (context, index) {
                    final receiver = reCeiverstorage.getAt(index) as ReceiverStorage;
                    return Padding(padding: EdgeInsets.only(bottom: 2.h),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                          border: Border.all(width: 3.sp, color: backgroundColor),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.person, size: 25.sp),
                          title: Text(
                            receiver.receiverName,
                            style: textStyle.copyWith(
                              fontSize: 20.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          subtitle: Text(
                            "\u20A6${receiver.receiverAmount1}",
                            style: TextStyle(
                              color: backgroundColor,
                              fontSize: 17.sp,
                            ),
                          ),
                          trailing: FittedBox(
                            child: Text(
                              "Date ${receiver.dateSent} \nTime ${receiver.timeSent}",
                              style: textStyle.copyWith(fontSize: 15.sp),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}
