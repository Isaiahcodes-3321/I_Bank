import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constant/Themes.dart';

class HomeTransactionHistory extends StatelessWidget {
  const HomeTransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Transaction history',
                style: textStyle.copyWith(fontSize: 17.sp)),
            GestureDetector(
              onTap: () {
              },
              child: Text('See all',
                  style:
                      textStyle.copyWith(fontSize: 17.sp, color: Colors.green)),
            )
          ],
        )
      ],
    );
  }
}
