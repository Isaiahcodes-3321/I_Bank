import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Constant/Themes.dart';
import 'package:pagination_view/pagination_view.dart';


class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(padding: EdgeInsets.all(20.sp),
    child: Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Transaction History',style: textStyle.copyWith(fontSize: 23.sp)),
      SingleChildScrollView(
        // child: ,
        )
    ],)),);
  }
}