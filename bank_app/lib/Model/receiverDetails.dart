import 'package:flutter/material.dart';

class ReceiverDetails extends ChangeNotifier {
  String sendMoney = '';
  String get _sendMoney => sendMoney;

  // get The receiver name that the user type
  String receiverName = '';
  String get _receiverName => receiverName;

  // get The receiver Phone number that the user type
  String receiverPhoneNumber = '';
  String get _receiverPhoneNumber => receiverPhoneNumber;
  

  void updateMoneySent(
      String sendmoney, receiverName, receiverPhoneNumber) {
    this.sendMoney = sendmoney;
    this.receiverName = receiverName;
    this.receiverPhoneNumber = receiverPhoneNumber;
    notifyListeners();
  }
}



