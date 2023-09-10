import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Animations/Dialogs/Insufficient funds.dart';
import '../../Animations/Dialogs/alertDialog.dart';
import '../../Constant/Themes.dart';
import '../../Constant/reUsedTextField.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:date_format/date_format.dart';
import '../../Model/receiverDetails.dart';
import '../../Storage/person.dart';
// import 'package:telephony/telephony.dart';

class TransferTab extends StatefulWidget {
  const TransferTab({super.key});

  @override
  State<TransferTab> createState() => _TransferTabState();
}

class _TransferTabState extends State<TransferTab> {
  var date = '';
  var time = '';

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  //  message: "From I Bank \u20A6$reCeiverAmount have been sent to you",

// get user input
  TextEditingController receiverName = TextEditingController();
  TextEditingController reCeiverAmount = TextEditingController();
  TextEditingController receiverPhoneNumbeR = TextEditingController();

  // Open Hive box for user storage
  Future<void> openHiveBox() async {
    receiverStorage = await Hive.openBox<ReceiverStorage>('receiverBox');
  }

  // Write data
  Future<void> writeUserData() async {
    if (reCeiverAmount.text.isNotEmpty) {
      // final userStorageKey = 'userName_Funds';
      final userStorageData = ReceiverStorage(
        dateSent: date,
        timeSent: time,
        receiverAmount1: reCeiverAmount.text,
        receiverName: receiverName.text,
        receiverNumber: receiverPhoneNumbeR.text,
      );
      await receiverStorage.add(userStorageData);
    }
  }

//  update the user Money
  late int fundsValue1;
  Future<void> subtractMoney() async {
    if (reCeiverAmount.text.isNotEmpty) {
      String userStorageKey = 'userName_Funds';

      // Check if the key exists in the box
      if (userStorage.containsKey(userStorageKey)) {
        // Get the existing data
        UserStorage? existingData = userStorage.get(userStorageKey);

        // Update the funds field
        existingData?.funds -= fundsValue1;

        // Put the updated data back into the box
        userStorage.put(userStorageKey, existingData!);
      }
    }
  }

  @override
  void dispose() {
    reCeiverAmount.dispose();
    receiverName.dispose();
    receiverPhoneNumbeR.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Transfer', style: textStyle),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.sp,
                ),
                border: Border.all(width: 1.w, color: backgroundColor),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ReUsedTextField(
                        controller: reCeiverAmount,
                        keyboardType: TextInputType.number,
                        inputFormatters: [ThousandsFormatter()],
                        hintText: " Amount",
                        onChanged: (value) {
                          // get the current date and month and time
                          setState(() {
                            var datetime = DateTime.now();
                            date = formatDate(
                                DateTime.now(), [d, ", ", M, ", ", yyyy]);
                            time =
                                '${datetime.hour}:${datetime.minute}:${datetime.second}';
                          });
                        },
                      ),
                      ReUsedTextField(
                        controller: receiverPhoneNumbeR,
                        keyboardType: TextInputType.phone,
                        hintText: " Phone Number",
                        onChanged: (value) {},
                      ),
                      ReUsedTextField(
                        controller: receiverName,
                        keyboardType: TextInputType.text,
                        hintText: " Name",
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (reCeiverAmount.text.isEmpty ||
                              receiverName.text.isEmpty ||
                              receiverPhoneNumbeR.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: snackbarBackgroundColor,
                                content: FittedBox(
                                  child: Text(
                                      "Transfer Failed! Please fill all inputs correctly",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: fontFamily)),
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } else {
                            // Get the existing data
                            String userStorageKey = 'userName_Funds';
                            UserStorage? existingData =
                                userStorage.get(userStorageKey);

                            String fundsText =
                                reCeiverAmount.text.replaceAll(',', '');
                            fundsValue1 = int.tryParse(fundsText) ?? 0;

                            if (existingData != null) {
                              if (existingData.funds < fundsValue1) {
                                showPlatformDialog(
                                  context: context,
                                  builder: (context) {
                                    return (Insufficientfunds());
                                  },
                                );
                              } else {
                                 // send data to user data and time provider
                                Provider.of<ReceiverDetails>(context,
                                    listen: false)
                                  ..updateMoneySent(
                                      reCeiverAmount.text,
                                      receiverName.text,
                                      receiverPhoneNumbeR.text);
                                // send data to user data and time provider
                                Provider.of<DateAndTime>(context, listen: false)
                                  ..timeandDATE(date, time);

                                // show dialog of Transaction successfully
                                showPlatformDialog(
                                  context: context,
                                  builder: (context) {
                                    return (ShowDialog());
                                  },
                                );

                                //  calling funtion to subtract money when user send any amount
                                setState(() {
                                  subtractMoney();
                                  writeUserData();
                                });

                                print('Stored Data');
                                // if user clicks on ok clear text that have been inputed by the user
                                reCeiverAmount.clear();
                                receiverName.clear();
                                receiverPhoneNumbeR.clear();
                              }
                            } else {
                              showPlatformDialog(
                                context: context,
                                builder: (context) {
                                  return (Insufficientfunds());
                                },
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(backgroundColor),
                        ),
                        child: Padding(
                          padding: buttonPadding,
                          child: Text('Send',
                              style: textStyle.copyWith(
                                  fontSize: 18.sp, color: Colors.white)),
                        ),
                      ),
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
