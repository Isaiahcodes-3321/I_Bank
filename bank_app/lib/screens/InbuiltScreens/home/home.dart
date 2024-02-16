import 'homeTransactionHistory.dart';
import '../../../Storage/person.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool hideMoney = false;

  final List<Color> _colors = [appBackgroundColor,  const Color.fromRGBO(175, 20, 131, 1)];
  int _currentColorIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

// animation to the Card background
  void _startAnimation() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      });
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the user data from the box
    late UserStorage? userFund =
        userStorage.isNotEmpty ? userStorage.getAt(0) : null;
        // Check if userFund is not null
    String formattedUserFund = userFund != null
    // Use a regular expression to match groups of three digits (thousands)
        ? userFund.funds.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match match) => '${match[1]},',
            )
        : '';

    late UserStorage? userName =
        userStorage.isNotEmpty ? userStorage.getAt(0) : null;

    var textStyleHomePage = TextStyle(
      fontSize: 20.sp,
      color: _colors[_currentColorIndex] == appGreenColor
          ? whiteColor
          : whiteColor,
    );

    var txtUserName = textStyle.copyWith(
      color: _colors[_currentColorIndex] == appGreenColor
          ? whiteColor
          : whiteColor,
      fontSize: 19.sp,
      overflow: TextOverflow.ellipsis,
    );
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 20,
                  color: const Color.fromARGB(128, 230, 229, 229),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: _colors[_currentColorIndex],
                      borderRadius: BorderRadius.circular(14.sp),
                    ),
                    duration: const Duration(seconds: 1),
                    alignment: Alignment.center,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 900),
                      opacity: _currentColorIndex == 0 ? 1.0 : 1.0,
                      child: Padding(
                        padding: EdgeInsets.all(17.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                userName != null
                                    ? Text(userName.name,
                                        style: txtUserName)
                                    : Text(".....", style: txtUserName),
                                Text(
                                  '4802 **** **** 2903',
                                  style: textStyle.copyWith(
                                    color: _colors[_currentColorIndex] ==
                                            appGreenColor
                                        ? whiteColor
                                        : whiteColor,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BALANCE',
                                  style: textStyle.copyWith(
                                    color: _colors[_currentColorIndex] ==
                                            appGreenColor
                                        ? whiteColor
                                        : whiteColor,
                                    fontSize: 19.sp,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    hideMoney
                                        ? Text('****', style: textStyleHomePage)
                                        : userFund != null
                                            ? Text(
                                                "\u20A6$formattedUserFund",
                                                style: textStyleHomePage,
                                              )
                                            : Text(
                                                "\u20A60000",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color:
                                                      _colors[_currentColorIndex] ==
                                                              appGreenColor
                                                          ? whiteColor
                                                          : whiteColor,
                                                ),
                                              ),
                                    IconButton(
                                      icon: hideMoney
                                          ?  Icon(Icons.visibility_off,
                                              color: whiteColor)
                                          :  Icon(Icons.visibility,
                                              color: whiteColor),
                                      onPressed: () {
                                        setState(() {
                                          hideMoney = !hideMoney;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.w, right: 1.w),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: appBackgroundColor, width: 5.sp),
                          borderRadius: const BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                          padding: EdgeInsets.all(13.sp),
                          child: Center(
                              child: Text(
                            'History',
                            style: textStyle.copyWith(fontSize: 20.sp),
                          ))),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Transaction history',
                            style: textStyle.copyWith(fontSize: 17.sp)),
                        GestureDetector(
                          onTap: () {
                            // Handle the tap event here
                          },
                          child: Row(
                            children: [
                              Text('See all click',
                                  style: textStyle.copyWith(
                                      fontSize: 17.sp, color: appGreenColor)),
                              Icon(Icons.history, color: appBackgroundColor),
                              Text("👇", style: TextStyle(fontSize: 20.sp)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              HomeTransactionHistory(),
            ],
          )),
    );
  }
}
