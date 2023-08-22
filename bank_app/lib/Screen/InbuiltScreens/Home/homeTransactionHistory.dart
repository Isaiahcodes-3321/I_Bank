import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constant/Themes.dart';
import '../../../Storage/person.dart';

class HomeTransactionHistory extends StatelessWidget {
  const HomeTransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final reCeiverstorage = Hive.box<ReceiverStorage>('receiverBox');

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              reverse: true,
              // checking for the length that should be displayed 
              itemCount: reCeiverstorage.length >= 4 ? 4 : reCeiverstorage.length,
              itemBuilder: (context, index) {
                final receiverIndex = reCeiverstorage.length >= 4 ? reCeiverstorage.length - 4 + index : index;
              //  get the index values 
                final receiver = reCeiverstorage.getAt(receiverIndex) as ReceiverStorage;
                return Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
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
    );
  }
}
