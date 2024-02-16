import '../../../Storage/person.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Model/receiverDetails.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:bank_app/widgets/reUsedTextField.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../globalDialogs/Dialogs/alertDialog.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:bank_app/globalDialogs/dialogs/insufficient_funds.dart';
import 'package:bank_app/screens/InbuiltScreens/transfer/controllers.dart';





class TransferTab extends StatefulWidget {
  const TransferTab({super.key});

  @override
  State<TransferTab> createState() => _TransferTabState();
}

class _TransferTabState extends State<TransferTab> {
  @override
  void initState() {
    super.initState();
    ControllerForTransfer.openHiveBox();
  }

  @override
  void dispose() {
    ControllerForInputTransfer.reCeiverAmount.dispose();
    ControllerForInputTransfer.receiverName.dispose();
    ControllerForInputTransfer.receiverPhoneNumbeR.dispose();
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
                border: Border.all(width: 1.w, color: appBackgroundColor),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ReUsedTextField(
                        controller: ControllerForInputTransfer.reCeiverAmount,
                        keyboardType: TextInputType.number,
                        inputFormatters: [ThousandsFormatter()],
                        hintText: " Amount",
                        onChanged: (value) {
                          // get the current date and month and time
                          setState(() {
                            var datetime = DateTime.now();
                            ControllerForTransfer.date = formatDate(
                                DateTime.now(), [d, ", ", M, ", ", yyyy]);
                            ControllerForTransfer.time =
                                '${datetime.hour}:${datetime.minute}:${datetime.second}';
                          });
                        },
                      ),
                      ReUsedTextField(
                        controller:
                            ControllerForInputTransfer.receiverPhoneNumbeR,
                        keyboardType: TextInputType.phone,
                        hintText: " Phone Number",
                        onChanged: (value) {},
                      ),
                      ReUsedTextField(
                        controller: ControllerForInputTransfer.receiverName,
                        keyboardType: TextInputType.text,
                        hintText: " Name",
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (ControllerForInputTransfer
                                  .reCeiverAmount.text.isEmpty ||
                              ControllerForInputTransfer
                                  .receiverName.text.isEmpty ||
                              ControllerForInputTransfer
                                  .receiverPhoneNumbeR.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: snackbarBackgroundColor,
                                content: FittedBox(
                                  child: Text(
                                      "Transfer Failed! Please fill all inputs correctly",
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontFamily: fontFamily)),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          } else {
                            // Get the existing data
                            String userStorageKey = 'userName_Funds';
                            UserStorage? existingData =
                                userStorage.get(userStorageKey);

                            String fundsText = ControllerForInputTransfer
                                .reCeiverAmount.text
                                .replaceAll(',', '');
                            ControllerForTransfer.fundsValue1 =
                                int.tryParse(fundsText) ?? 0;

                            if (existingData != null) {
                              if (existingData.funds <
                                  ControllerForTransfer.fundsValue1) {
                                showPlatformDialog(
                                  context: context,
                                  builder: (context) {
                                    return ( const Insufficientfunds());
                                  },
                                );
                              } else {
                                // send data to user data and time provider
                                Provider.of<ReceiverDetails>(context,
                                        listen: false)
                                    .updateMoneySent(
                                        ControllerForInputTransfer
                                            .reCeiverAmount.text,
                                        ControllerForInputTransfer
                                            .receiverName.text,
                                        ControllerForInputTransfer
                                            .receiverPhoneNumbeR.text);
                                // send data to user data and time provider
                                Provider.of<Date>(context, listen: false)
                                    .dATE(ControllerForTransfer.date);

                                // show dialog of Transaction successfully
                                showPlatformDialog(
                                  context: context,
                                  builder: (context) {
                                    return (const ShowDialog());
                                  },
                                );

                                //  calling funtion to subtract money when user send any amount
                                setState(() {
                                  ControllerForTransfer.subtractMoney();
                                  ControllerForTransfer.writeUserData();
                                });

                                print('Stored Data');
                                // if user clicks on ok clear text that have been inputed by the user
                                ControllerForInputTransfer.reCeiverAmount
                                    .clear();
                                ControllerForInputTransfer.receiverName.clear();
                                ControllerForInputTransfer.receiverPhoneNumbeR
                                    .clear();
                              }
                            } else {
                              showPlatformDialog(
                                context: context,
                                builder: (context) {
                                  return (const Insufficientfunds());
                                },
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(appBackgroundColor),
                        ),
                        child: Padding(
                          padding: buttonPadding,
                          child: Text('Send',
                              style: textStyle.copyWith(
                                  fontSize: 18.sp, color: whiteColor)),
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

// class Controller {
//   static final _easySmsPlugin = EasySms();

//   static Future<void> sendSms({required String phone, required msg}) async {
//     try {
//       print('sending sms');
//       _easySmsPlugin.requestSmsPermission();
//       _easySmsPlugin.sendSms(phone: phone, msg: msg);
//       print('Sending SMS to $phone: $msg');
//     } catch (err) {
//       print("Error its ${err.toString()}");
//     }
//   }
// }
