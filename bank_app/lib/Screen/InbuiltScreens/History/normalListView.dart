import 'package:bank_app/Constant/Themes.dart';
import 'package:bank_app/Storage/person.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NormalListView extends StatelessWidget {
   NormalListView({super.key});

   
   final reCeiverstorage = Hive.box<ReceiverStorage>('receiverBox');

  @override
  Widget build(BuildContext context) {
    return   Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: reCeiverstorage.length,
                      itemBuilder: (context, index) {
                        final receiver =
                            reCeiverstorage.getAt(index) as ReceiverStorage;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.sp)),
                              border: Border.all(
                                  width: 3.sp, color: backgroundColor),
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