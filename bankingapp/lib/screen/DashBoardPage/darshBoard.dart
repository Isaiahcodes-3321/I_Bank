import 'package:bankingapp/screen/DashBoardPage/Homepage/homeTab.dart';
import 'package:bankingapp/screen/DashBoardPage/TransferPage/tranferTab.dart';
import 'package:bankingapp/screen/DashBoardPage/SettingPage/settingTab.dart';
import 'package:bankingapp/screen/DashBoardPage/HistoryPage/historyTab.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';

class DashBoardscreeen extends StatefulWidget {
  DashBoardscreeen({super.key, required this.getUsername});
  final getUsername;
   

  @override
  State<DashBoardscreeen> createState() => _DashBoardscreeenState();
}

class _DashBoardscreeenState extends State<DashBoardscreeen> {
  int currentPage = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  late final List<Widget> tabPages = [
    HomeTab( displayName: widget.getUsername),
    TranferTab(),
    HistoryTab(),
    SettingTab(),
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(101, 0, 56, 1.0),
          leadingWidth: double.infinity,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                
                Text(''),
                Column( crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Welcome ", style: TextStyle(fontSize: 15.sp,color: Color.fromARGB(255, 221, 221, 221))),
                  Text(
                    widget.getUsername.text,
                    style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
                  )
                ])
              ],
            ),
          ),
        ),
    
        body: tabPages[currentPage],
    
        bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            items: <Widget>[
              Icon(Icons.home, size: 30.sp,color: Colors.white),
              Icon(Icons.sync_alt_outlined, size: 30.sp,color: Colors.white),
              Icon(Icons.history, size: 30.sp,color: Colors.white),
              Icon(Icons.settings, size: 30.sp,color: Colors.white),
            ],
            color:  Color.fromRGBO(101, 0, 56, 1.0),
            buttonBackgroundColor:  Color.fromRGBO(101, 0, 56, 1.0),
            animationCurve: Curves.easeInOut,
            backgroundColor: Color.fromRGBO(101, 0, 56, 0.45),
            animationDuration: Duration(milliseconds: 400),
            onTap: (index) {
              setState(() {
                currentPage = index;
              });
            },
            letIndexChange: (index) => true,
          ),
      ),
    );
  }
}
