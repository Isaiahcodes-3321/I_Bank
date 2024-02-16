import 'package:flutter/material.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:bank_app/Storage/person.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ControllerForTransfer {
  static var date = '';
  static var time = '';
  // value holding funds when user need to fund his wallet
  static late int fundsValue1;

  // Open Hive box for user storage
  static Future<void> openHiveBox() async {
    receiverStorage = await Hive.openBox<ReceiverStorage>('receiverBox');
  }

// funtion to subtract money when user send any money
  static Future<void> subtractMoney() async {
    if (ControllerForInputTransfer.reCeiverAmount.text.isNotEmpty) {
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

  // Write receiver data to storage
  static Future<void> writeUserData() async {
    if (ControllerForInputTransfer.reCeiverAmount.text.isNotEmpty) {
      // final userStorageKey = 'userName_Funds';
      final userStorageData = ReceiverStorage(
        dateSent: ControllerForTransfer.date,
        timeSent: ControllerForTransfer.time,
        receiverAmount1: ControllerForInputTransfer.reCeiverAmount.text,
        receiverName: ControllerForInputTransfer.receiverName.text,
        receiverNumber: ControllerForInputTransfer.receiverPhoneNumbeR.text,
      );
      await receiverStorage.add(userStorageData);
    }
  }
}

class ControllerForInputTransfer {
// Store user input
  static TextEditingController receiverName = TextEditingController();
  static TextEditingController reCeiverAmount = TextEditingController();
  static TextEditingController receiverPhoneNumbeR = TextEditingController();
}
