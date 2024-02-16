import 'exportHistory.dart';


class HistoryTab extends StatelessWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receiverStorage = Hive.box<ReceiverStorage>('receiverBox');
    bool checkForData = receiverStorage.isNotEmpty; // Check if there's any data

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text("Transaction History",
                  style: textStyle.copyWith(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 5.h,
            ),

            if (checkForData)
              if (receiverStorage.length > 5)
                AnimatedListView()
              else
                NormalListView()
            else
              Padding(
                padding: EdgeInsets.only(bottom: 15.h, top: 15.h),
                child: Center(
                    child: Column(
                  children: [
                    Icon(Icons.cancel_outlined,
                        color: appBackgroundColor, size: 40.sp),
                    FittedBox(
                      child: Text("No transactions were made.",
                          style: textStyle.copyWith(
                              fontSize: 30.sp, color: appBackgroundColor)),
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
