import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Constant/Themes.dart';
import '../../../Storage/person.dart';

class HomeTransactionHistory extends StatelessWidget {
  HomeTransactionHistory({Key? key}) : super(key: key);

  final _scrollController = FixedExtentScrollController();

  static double _itemHeight = 13.h;

  @override
  Widget build(BuildContext context) {
    final reCeiverstorage = Hive.box<ReceiverStorage>('receiverBox');
    bool checkForData = reCeiverstorage.isNotEmpty; // Check if there's any data

    void addItem(ReceiverStorage newItem) {
      if (reCeiverstorage.length >= 4) {
        reCeiverstorage.deleteAt(
            0); // Remove the oldest item to maintain the length of 4 items
      }
      reCeiverstorage.add(newItem); // Add the new item
    }

    return Expanded(
        child: Column(
      children: [
        if (checkForData)
          Expanded(
            child: ClickableListWheelScrollView(
              scrollController: _scrollController,
              itemHeight: _itemHeight,
              itemCount: reCeiverstorage.length >= 4 ? 4 : reCeiverstorage.length,
              onItemTapCallback: (index) {
                print("noItemTapCallback index: $index");
                // Add your onTap logic here
              },
              child: ListWheelScrollView.useDelegate(
                controller: _scrollController,
                itemExtent: _itemHeight,
                physics: FixedExtentScrollPhysics(),
                overAndUnderCenterOpacity: 0.4,
                perspective: 0.010,
                onSelectedItemChanged: (index) {
                  print("onSelectedItemChanged index: $index");
                  // Add your onSelectedItemChanged logic here
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final reversedIndex = reCeiverstorage.length - index - 1;
                    final receiver =
                        reCeiverstorage.getAt(reversedIndex) as ReceiverStorage;
          
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Container(
                        decoration: listTileDecoration,
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
                  childCount:
                      reCeiverstorage.length >= 4 ? 4 : reCeiverstorage.length,
                ),
              ),
            ),
          )
        else
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Center(
                    child: Column(
                  children: [
                    Icon(Icons.cancel_outlined,
                        color: backgroundColor, size: 35.sp),
                    FittedBox(
                      child: Text("No transactions were made.",
                          style: textStyle.copyWith(
                              fontSize: 25.sp, color: backgroundColor)),
                    )
                  ],
                )),
              ),
            ),
          ), 
      ],
    ));
  }
}
