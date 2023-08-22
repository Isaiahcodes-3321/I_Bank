import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Storage/person.dart';


//my storage Make Hive accessible anywhere,
late Box<UserStorage> userStorage;
late Box<UserStorageImage> userStorageImage;
late Box<ReceiverStorage> receiverStorage;

var fontFamily = 'BodoniModa-VariableFont_opsz,wght';

var backgroundColor = Color.fromRGBO(101, 0, 56, 1.0);
var snackbarBackgroundColor = Color.fromRGBO(134, 20, 83, 0.705);

var textStyle = TextStyle(
    color: Color.fromRGBO(101, 0, 56, 1.0),
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 25.sp);

var buttonPadding =
    EdgeInsets.only(bottom: 1.h, top: 1.h, left: 4.w, right: 4.w);


var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.sp),
    borderSide: BorderSide(color: Color.fromRGBO(101, 0, 56, 1.0), width: 1.w));
