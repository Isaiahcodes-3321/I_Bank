import 'package:flutter/material.dart';
import 'package:bank_app/widgets/Themes.dart';

// reuse snackbar
 showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: snackbarBackgroundColor,
      content: Text(
        message,
        style: TextStyle(color: whiteColor, fontFamily: fontFamily),
      ),
      duration: const Duration(seconds: 4),
    ),
  );
}
