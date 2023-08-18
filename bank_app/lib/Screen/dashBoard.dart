import 'dart:io';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../Constant/Themes.dart';
import '../Storage/person.dart';
import 'InbuiltScreens/history.dart';
import 'InbuiltScreens/Home/home.dart';
import 'InbuiltScreens/settings.dart';
import 'InbuiltScreens/transfer.dart';
import 'package:image_picker/image_picker.dart';

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
  var textstyle = textStyle.copyWith(
    color: Colors.white,
    fontSize: 17.sp,
  );

  @override
  Widget build(BuildContext context) {
    // Get the user data from the box
    late UserStorage? userName =
        userStorage.isNotEmpty ? userStorage.getAt(0) : null;
    late UserStorage? userPicture =
        userStorage.isNotEmpty ? userStorage.getAt(0) : null;

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
                        backgroundImage: userPicture.userImage is String &&
                                userPicture.userImage.isNotEmpty
                            ? AssetImage(userPicture.userImage)
                                as ImageProvider<Object>?
                            : userPicture.userImage is XFile &&
                                    userPicture.userImage.path.isNotEmpty
                                ? FileImage(File(userPicture.userImage.path))
                                    as ImageProvider<Object>?
                                : AssetImage('images/logo.png'),
                      )
                    : Container(
                        decoration: BoxDecoration(
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
