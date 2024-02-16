import 'exportHistory.dart';


class NormalListView extends StatelessWidget {
  NormalListView({super.key});

  final receiverStorage = Hive.box<ReceiverStorage>('receiverBox');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: receiverStorage.length,
              itemBuilder: (context, index) {
                final receiver =
                    receiverStorage.getAt(index) as ReceiverStorage;
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
            ),
          ],
        ),
      ),
    );
  }
}
  //  Icon(Icons.arrow_outward, size: 10.sp,color: Colors.green,)