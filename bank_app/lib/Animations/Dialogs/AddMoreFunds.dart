import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Constant/Themes.dart';
import '../../Constant/reUsedTextField.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import '../../Storage/person.dart';

class AddMoreFunds extends StatefulWidget {
  const AddMoreFunds({super.key});

  @override
  State<AddMoreFunds> createState() => _AddMoreFundsState();
}

class _AddMoreFundsState extends State<AddMoreFunds> {
  @override
  Widget build(BuildContext context) {
    var addAmount = TextEditingController();

    //  update the user Money
    Future<void> writeUserDataNewMoney() async {
      String addNewAmount = addAmount.text.replaceAll(',', '');
      int fundsValue1 = int.tryParse(addNewAmount) ?? 0;

      // int fundsValue1 = int.parse(addAmount.text);

      if (addAmount.text.isNotEmpty) {
        const userStorageKey = 'userName_Funds';

        // Check if the key exists in the box
        if (userStorage.containsKey(userStorageKey)) {
          // Get the existing data
          UserStorage? existingData = userStorage.get(userStorageKey);

          // Update the funds field
          existingData?.funds += fundsValue1;

          // Put the updated data back into the box
          userStorage.put(userStorageKey, existingData!);
        }
      }
    }

    return AlertDialog(
      content: SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(5.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: ReUsedTextField(
              controller: addAmount,
              keyboardType: TextInputType.number,
              inputFormatters: [ThousandsFormatter()],
              hintText: " Add Money",
              onChanged: (value) {},
            ),
          ),
          Flexible(
            child: TextButton(
              onPressed: () async {
                setState(() {
                  writeUserDataNewMoney();
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: snackbarBackgroundColor,
                    content: Text("Money added successfully",
                        style: TextStyle(
                            color: Colors.white, fontFamily: fontFamily)),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.sp),
                child: Text('Save',
                    style: textStyle.copyWith(
                        fontSize: 15.sp, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
        ),
      ),
    );
  }
}
