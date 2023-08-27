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

 // set the padding horizontal: left and right  while vertical: top and bottom
var buttonPadding =
     EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h);

var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.sp),
    borderSide: BorderSide(color: Color.fromRGBO(101, 0, 56, 1.0), width: 1.w));

var listTileDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(15.sp)),
  border: Border.all(width: 5.sp, color: backgroundColor),
);
