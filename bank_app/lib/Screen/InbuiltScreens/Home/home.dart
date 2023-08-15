import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constant/Themes.dart';
// import '../history.dart';
import 'homeTransactionHistory.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool hideMoney = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: backgroundColor,
                  elevation: 20,
                  child: Padding(
                    padding: EdgeInsets.all(17.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Isaiah shell owologbo',
                                  style: textStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 19.sp,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Text('4802 **** **** 2903',
                                  style: textStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('BALANCE',
                                  style: textStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 19.sp,
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  hideMoney
                                      ? Text('****',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white))
                                      : Text('\u20A69000',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white)),
                                  IconButton(
                                    icon: hideMoney
                                        ? const Icon(Icons.visibility,
                                            color: Colors.white)
                                        : const Icon(Icons.visibility_off,
                                            color: Colors.white),
                                    color:
                                        const Color.fromARGB(255, 28, 27, 27),
                                    onPressed: () {
                                      setState(() {
                                        hideMoney = !hideMoney;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: backgroundColor, width: 5.sp),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                    padding: EdgeInsets.all(13.sp),
                    child: Center(
                        child: Text(
                      'History',
                      style: textStyle.copyWith(fontSize: 20.sp),
                    ))),
              ),
                SizedBox(
                height: 5.h,
              ),
             HomeTransactionHistory(),
            ],
          )),
    );
  }
}
