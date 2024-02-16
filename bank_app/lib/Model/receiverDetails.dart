import 'package:flutter/material.dart';

class ReceiverDetails extends ChangeNotifier {
  String sendMoney = '';

  // get The receiver name that the user type
  String receiverName = '';

  // get The receiver Phone number that the user type
  String receiverPhoneNumber = '';
  

  void updateMoneySent(
      String sendmoney, receiverName, receiverPhoneNumber) {
    sendMoney = sendmoney;
    this.receiverName = receiverName;
    this.receiverPhoneNumber = receiverPhoneNumber;
    notifyListeners();
  }
}

class Date extends ChangeNotifier{
  String date = '';

  void dATE( String date){
    this.date = date;
    notifyListeners();
  }
}



