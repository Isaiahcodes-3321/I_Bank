import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../Constant/Themes.dart';
import '../Storage/person.dart';
import 'InbuiltScreens/History/history.dart';
import 'InbuiltScreens/Home/home.dart';
import 'InbuiltScreens/settings.dart';
import 'InbuiltScreens/transfer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DashBoardscreeen extends StatefulWidget {
  const DashBoardscreeen({super.key});

  @override
  State<DashBoardscreeen> createState() => _DashBoardscreeenState();
}

class _DashBoardscreeenState extends State<DashBoardscreeen> {
  @override
  void initState() {
    super.initState();
    startInternetCheck();
  }

  void startInternetCheck() {
    // keep checking for internet connection every 5 sec 
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) showBanner(context);
    });
  }

  Future<void> showBanner(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: snackbarBackgroundColor,
          content: Text(
              "Failed to continue. Please check your internet connection.",
              style: TextStyle(color: Colors.white, fontFamily: fontFamily)),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }


  int currentPage = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  var backgroundColor = const Color.fromRGBO(101, 0, 56, 1.0);

  late final List<Widget> tabPages = [
    const HomeTab(),
    const TransferTab(),
    const HistoryTab(),
    const SettingTab(),
  ];
  var textstyle = textStyle.copyWith(
    color: Colors.white,
    fontSize: 17.sp,
  );

  @override
  Widget build(BuildContext context) {
    // Get the user data from the box
    late UserStorage? userName =
        userStorage.isNotEmpty ? userStorage.getAt(0) : null;
    late UserStorageImage? userPicture =
        userStorageImage.isNotEmpty ? userStorageImage.getAt(0) : null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hi👋",
                        style: textStyle.copyWith(
                            color: Colors.white, fontSize: 15.sp)),
                    userName != null
                        ? Text("${userName.name}", style: textstyle)
                        : Text("Hello", style: textstyle),
                  ]),
              CircleAvatar(
                radius: 19.sp,
                backgroundColor: backgroundColor,
                child: userPicture != null
                    ? CircleAvatar(
                        backgroundImage: (userPicture.userImage.isNotEmpty)
                            ? MemoryImage(userPicture.userImage)
                                as ImageProvider<Object>?
                            : const AssetImage(''),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 26.sp,
                          color: Colors.grey,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      body: tabPages[currentPage],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home, size: 25.sp, color: Colors.white),
          Icon(Icons.sync_alt_outlined, size: 25.sp, color: Colors.white),
          Icon(Icons.history, size: 25.sp, color: Colors.white),
          Icon(Icons.settings, size: 25.sp, color: Colors.white),
        ],
        color: backgroundColor,
        buttonBackgroundColor: backgroundColor,
        animationCurve: Curves.easeInOut,
        height: 65.0, // Adjust the height value as needed
        backgroundColor: const Color.fromRGBO(101, 0, 56, 0.45),
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
