import 'package:bank_app/Constant/Themes.dart';
import 'package:bank_app/Storage/person.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnimatedListview extends StatelessWidget {
   AnimatedListview({super.key});

  final _scrollController = FixedExtentScrollController();

  static double _itemHeight = 13.h;
  @override
  Widget build(BuildContext context) {
     final reCeiverstorage = Hive.box<ReceiverStorage>('receiverBox');

    return  Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                  child: ClickableListWheelScrollView(
                    scrollController: _scrollController,
                    itemHeight: _itemHeight,
                    itemCount: reCeiverstorage.length,
                    onItemTapCallback: (index) {
                      print("onItemTapCallback index: $index");
                      // Add your onTap logic here
                    },
                    child: ListWheelScrollView.useDelegate(
                      controller: _scrollController,
                      itemExtent: _itemHeight,
                      physics: FixedExtentScrollPhysics(),
                      overAndUnderCenterOpacity: 0.4,
                      perspective: 0.003,
                      onSelectedItemChanged: (index) {
                        print("onSelectedItemChanged index: $index");
                        // Add your onSelectedItemChanged logic here
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          final receiverIndex =
                              reCeiverstorage.length - index - 1;
                          final receiver = reCeiverstorage.getAt(receiverIndex)
                              as ReceiverStorage;
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.sp)),
                                border: Border.all(
                                    width: 5.sp, color: backgroundColor),
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
                        childCount: reCeiverstorage.length,
                      ),
                    ),
                  ),
                ),
              );
  }
}