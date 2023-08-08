import 'package:flutter/material.dart';

class UserName extends ChangeNotifier {
  String userName = '';
  String get user_Name => userName;

  void updateUserName(String newuserName) {
    userName = newuserName;
    notifyListeners();
  }
}

class UserFunds extends ChangeNotifier {
  String fund = '';
  String get user_fund => fund;

  void updateUserName(String newFunds) {
    fund = newFunds;
    notifyListeners();
  }
}