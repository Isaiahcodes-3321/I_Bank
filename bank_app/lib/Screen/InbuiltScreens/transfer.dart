import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Animations/Dialogs/alertDialog.dart';
import '../../Animations/Dialogs/alertDialogErrorMessage.dart';
import '../../Constant/Themes.dart';
import '../../Constant/reUsedTextField.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:date_format/date_format.dart';
import '../../Model/receiverDetails.dart';

class TransferTab extends StatefulWidget {
  const TransferTab({super.key});

  @override
  State<TransferTab> createState() => _TransferTabState();
}

class _TransferTabState extends State<TransferTab> {
  var date = '';
  var time = '';

  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.sp),
      borderSide:
          BorderSide(color: Color.fromRGBO(101, 0, 56, 1.0), width: 1.w));

// get user input
  var receiverAmount = TextEditingController();
  var receiverName = TextEditingController();
  var receiverPhoneNumbeR = TextEditingController();

  @override
  void dispose() {
    receiverAmount.dispose();
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
            Text('Transfer', style: textStyle.copyWith(fontSize: 23.sp)),
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
                        controller: receiverAmount,
                        keyboardType: TextInputType.number,
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
                        keyboardType: TextInputType.number,
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
                        onPressed: () {
                          if (receiverAmount.text.isEmpty ||
                              receiverName.text.isEmpty ||
                              receiverPhoneNumbeR.text.isEmpty) {
                            showPlatformDialog(
                              context: context,
                              builder: (context) {
                                return (ShowDialogERRORINPUT());
                              },
                            );
                          } else {

                            Provider.of<ReceiverDetails>(context, listen: false)
                              ..updateMoneySent(receiverAmount.text,
                                  receiverName.text, receiverPhoneNumbeR.text);

                            showPlatformDialog(
                              context: context,
                              builder: (context) {
                                return (ShowDialog());
                              },
                            );

                            // if user clicks on this clear text that have been inputed by the user
                            receiverAmount.clear();
                            receiverName.clear();
                            receiverPhoneNumbeR.clear();
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
