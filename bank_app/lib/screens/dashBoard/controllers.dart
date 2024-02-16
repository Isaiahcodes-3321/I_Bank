import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bank_app/widgets/snackbarWidget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bank_app/screens/InbuiltScreens/home/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bank_app/screens/InbuiltScreens/history/history.dart';
import 'package:bank_app/screens/InbuiltScreens/setting/settings.dart';
import 'package:bank_app/screens/InbuiltScreens/transfer/transfer.dart';
// ignore_for_file: use_build_context_synchronously

class DashBoardControls {
  // get the current index number
  static int currentPage = 0;
  static final GlobalKey<CurvedNavigationBarState> bottomNavigationKey =
      GlobalKey();

// list of tabs
  static final List<Widget> tabPages = [
    const HomeTab(),
    const TransferTab(),
    const HistoryTab(),
    const SettingTab(),
  ];



  // check for internet connection
  static startInternetCheck(
    BuildContext context,
  ) {
    // keep checking for internet connection every 5 sec
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none)
        showBanner(
          context,
        );
    });
  }

  static Future<void> showBanner(
    BuildContext context,
  ) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showCustomSnackBar(context,
          "Failed to continue. Please check your internet connection.");
    }
  }
}
