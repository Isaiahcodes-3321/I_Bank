import '../../../Storage/person.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';


class HomeTransactionHistory extends StatelessWidget {
  HomeTransactionHistory({Key? key}) : super(key: key);

  final _scrollController = FixedExtentScrollController();

  static double _itemHeight = 13.h;

  @override
  Widget build(BuildContext context) {
    final reCeiverStorage = Hive.box<ReceiverStorage>('receiverBox');
    bool checkForData = reCeiverStorage.isNotEmpty; // Check if there's any data


    return Expanded(
        child: Column(
      children: [
        if (checkForData)
          Expanded(
            child: ClickableListWheelScrollView(
              scrollController: _scrollController,
              itemHeight: _itemHeight,
              itemCount:
                  reCeiverStorage.length >= 4 ? 4 : reCeiverStorage.length,
              onItemTapCallback: (index) {
                print("noItemTapCallback index: $index");
                // Add your onTap logic here
              },
              child: ListWheelScrollView.useDelegate(
                controller: _scrollController,
                itemExtent: _itemHeight,
                physics: const FixedExtentScrollPhysics(),
                overAndUnderCenterOpacity: 0.4,
                perspective: 0.010,
                onSelectedItemChanged: (index) {
                  print("onSelectedItemChanged index: $index");
                  // Add your onSelectedItemChanged logic here
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final reversedIndex = reCeiverStorage.length - index - 1;
                    final receiver =
                        reCeiverStorage.getAt(reversedIndex) as ReceiverStorage;

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
                              color: appBackgroundColor,
                              fontSize: 17.sp,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FittedBox(
                                child: Text(
                                  "Date ${receiver.dateSent} \nTime ${receiver.timeSent}",
                                  style: textStyle.copyWith(fontSize: 15.sp),
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.arrow_outward,
                                    size: 22.sp, color: whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount:
                      reCeiverStorage.length >= 4 ? 4 : reCeiverStorage.length,
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
                        color: appBackgroundColor, size: 35.sp),
                    FittedBox(
                      child: Text("No transactions were made.",
                          style: textStyle.copyWith(
                              fontSize: 25.sp, color: appBackgroundColor)),
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
