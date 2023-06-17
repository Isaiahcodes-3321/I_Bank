import 'package:flutter/material.dart';

class UserName extends ChangeNotifier{
  
  String getUsername = '';

  String get name => getUsername;

  void setName(String value) {
    getUsername = value;
    notifyListeners();
  }
}