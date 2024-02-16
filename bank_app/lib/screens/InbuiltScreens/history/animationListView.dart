import 'exportHistory.dart';



class AnimatedListView extends StatelessWidget {
  AnimatedListView({super.key});

  final _scrollController = FixedExtentScrollController();

  static final double _itemHeight = 13.h;
  @override
  Widget build(BuildContext context) {
    final reCeiverStorage = Hive.box<ReceiverStorage>('receiverBox');

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
        child: ClickableListWheelScrollView(
          scrollController: _scrollController,
          itemHeight: _itemHeight,
          itemCount: reCeiverStorage.length,
          onItemTapCallback: (index) {
            print("onItemTapCallback index: $index");
          },
          child: ListWheelScrollView.useDelegate(
            controller: _scrollController,
            itemExtent: _itemHeight,
            physics: const FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.4,
            perspective: 0.003,
            onSelectedItemChanged: (index) {
              print("onSelectedItemChanged index: $index");
              // Add your onSelectedItemChanged logic here
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                final receiverIndex = reCeiverStorage.length - index - 1;
                final receiver =
                    reCeiverStorage.getAt(receiverIndex) as ReceiverStorage;
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
                                size: 22.sp, color: appGreenColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: reCeiverStorage.length,
            ),
          ),
        ),
      ),
    );
  }
}
