import 'package:flutter/material.dart';

class ReceiverDetails extends ChangeNotifier {
  String sendMoney = '';

  // get The receiver name that the user type
  String receiverName = '';

  // get The receiver Phone number that the user type
  String receiverPhoneNumber = '';
  

  void updateMoneySent(
      String sendmoney, receiverName, receiverPhoneNumber) {
    this.sendMoney = sendmoney;
    this.receiverName = receiverName;
    this.receiverPhoneNumber = receiverPhoneNumber;
    notifyListeners();
  }
}

class DateAndTime extends ChangeNotifier{
  String date = '';

  void timeandDATE( String date){
    this.date = date;
    notifyListeners();
  }
}



