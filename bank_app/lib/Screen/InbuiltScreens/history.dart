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
    var yy = reCeiverstorage.length;
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
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Text("$yy")
              // ListView.builder(
              //   itemCount: reCeiverstorage.length,
              //   itemBuilder: (context, index) {
              //     final receiver = reCeiverstorage.getAt(index);
              //     return ListTile(
              //       leading: Icon(Icons.person),
              //       title: Text(receiver?.receiverName ?? 'No name'),
              //       subtitle:
              //           Text(receiver?.receiverAmount ?? 'No amount'),
              //       trailing:
              //           Text(receiver?.dateSent ?? 'No date'), // Assuming dateSent is of type String or you format it as needed
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}














  //  FutureBuilder<Box<ReceiverStorage>>(
                //   future: Hive.openBox('receiverBox'),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       if (snapshot.hasData) {
                //         final box = snapshot.data!;
                //         if (box.isNotEmpty) {
                //           return ListView.builder(
                //             itemCount: box.length,
                //             itemBuilder: (context, index) {
                //               final receiver = box.getAt(index);
                //               return ListTile(
                //                 title: Text(receiver?.receiverName ?? 'No name'),
                //                 subtitle:
                //                     Text(receiver?.reCeiverAmount ?? 'No amount'),
                //                 trailing:
                //                     Text(receiver?.dateSent ?? 'No date'), // Assuming dateSent is of type String or you format it as needed
                //                 leading: Icon(Icons.person),
                //               );
                //             },
                //           );
                //         }
                //       }
                //       return Center(child: Text('No data in Hive'));
                //     } else if (snapshot.hasError) {
                //       return Center(child: Text('Some error occurred'));
                //     } else {
                //       return Center(child: CircularProgressIndicator());
                //     }
                //   },
                // ),
