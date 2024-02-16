import '../../Storage/person.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:bank_app/screens/dashBoard/controllers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class DashBoardscreeen extends StatefulWidget {
  const DashBoardscreeen({super.key});

  @override
  State<DashBoardscreeen> createState() => _DashBoardscreeenState();
}

class _DashBoardscreeenState extends State<DashBoardscreeen> {
  @override
  void initState() {
    super.initState();
    DashBoardControls.startInternetCheck(context);
  }

  @override
  Widget build(BuildContext context) {
    // Get the user data from the box
    late UserStorage? userName =
        userStorage.isNotEmpty ? userStorage.getAt(0) : null;
    late UserStorageImage? userPicture =
        userStorageImage.isNotEmpty ? userStorageImage.getAt(0) : null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
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
                            color: whiteColor, fontSize: 15.sp)),
                    userName != null
                        ? Text(userName.name,
                            style: textStyle.copyWith(
                              color: whiteColor,
                              fontSize: 17.sp,
                            ))
                        : Text("Hello",
                            style: textStyle.copyWith(
                              color: whiteColor,
                              fontSize: 17.sp,
                            )),
                  ]),
              CircleAvatar(
                radius: 19.sp,
                backgroundColor: appBackgroundColor,
                child: userPicture != null
                    ? CircleAvatar(
                        backgroundImage: (userPicture.userImage.isNotEmpty)
                            ? MemoryImage(userPicture.userImage)
                                as ImageProvider<Object>?
                            : const AssetImage(''),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 26.sp,
                          color: grayColor,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      body: DashBoardControls.tabPages[DashBoardControls.currentPage],
      bottomNavigationBar: CurvedNavigationBar(
        key: DashBoardControls.bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home, size: 25.sp, color: whiteColor),
          Icon(Icons.sync_alt_outlined, size: 25.sp, color: whiteColor),
          Icon(Icons.history, size: 25.sp, color: whiteColor),
          Icon(Icons.settings, size: 25.sp, color: whiteColor),
        ],
        color: appBackgroundColor,
        buttonBackgroundColor: appBackgroundColor,
        animationCurve: Curves.easeInOut,
        height: 65.0, // Adjust the height value as needed
        backgroundColor: deepPurpleColor,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            DashBoardControls.currentPage = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
