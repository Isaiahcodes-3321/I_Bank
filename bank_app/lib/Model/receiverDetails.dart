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
  String time = '';

  void timeandDATE( String date,time){
    this.date = date;
    this.time = time;
    notifyListeners();
  }
}



