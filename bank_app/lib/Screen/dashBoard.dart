import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Constant/Themes.dart';
import 'InbuiltScreens/history.dart';
import 'InbuiltScreens/Home/home.dart';
import 'InbuiltScreens/settings.dart';
import 'InbuiltScreens/transfer.dart';

class DashBoardscreeen extends StatefulWidget {
  const DashBoardscreeen({super.key});

  @override
  State<DashBoardscreeen> createState() => _DashBoardscreeenState();
}

class _DashBoardscreeenState extends State<DashBoardscreeen> {
  int currentPage = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  var backgroundColor = Color.fromRGBO(101, 0, 56, 1.0);

  late final List<Widget> tabPages = [
    HomeTab(),
    TransferTab(),
    HistoryTab(),
    SettingTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome ",
                        style: textStyle.copyWith(
                            color: Colors.white, fontSize: 15.sp)),
                    Text(
                      "Welcome",
                      style: textStyle.copyWith(
                        color: Colors.white,
                        fontSize: 17.sp,
                      ),
                    )
                  ]),
              CircleAvatar(
                backgroundImage: AssetImage("images/logo.png"),
                radius: 20.sp,
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
        height: 9.h,
        backgroundColor: Color.fromRGBO(101, 0, 56, 0.45),
        animationDuration: Duration(milliseconds: 300),
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
