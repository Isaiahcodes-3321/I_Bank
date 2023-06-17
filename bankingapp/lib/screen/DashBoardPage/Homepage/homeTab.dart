import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
    required this.displayName
  });
   final displayName;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
   bool hideMoney = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        color: Color.fromRGBO(74, 1, 41, 1),
                        child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(alignment: Alignment.topLeft,
                                  child: Text.rich(
                                    TextSpan(
                                      text: widget.displayName.text,style: TextStyle(color: Colors.white,fontSize: 14.sp),
                                      children: [
                                        TextSpan(text: '\n9637 2862 2302 9819',style: TextStyle(color: Colors.white,fontSize: 13.sp))
                                      ],
                                    ),
                                  ),
                                ),
                                Align(alignment: Alignment.bottomLeft,
                                child:  Column( children: [
                                  Align(alignment: Alignment.bottomLeft,
                                    child: Text('Balance',style: TextStyle(color: Colors.white,fontSize: 15.sp),)),
                                 Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    hideMoney
                                        ? Text.rich(
                                            TextSpan(
                                              text: '\u{20A6}',style: TextStyle(color: Colors.white,fontSize: 14.sp),
                                              children: [
                                                TextSpan(
                                                    text:' 999',style: TextStyle(color: Colors.white,fontSize: 16.sp),
                                                   )
                                              ],
                                            ),
                                          )
                                        : Text('****',style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                                    IconButton(
                                      icon: hideMoney
                                          ? const Icon(Icons.visibility,color: Colors.white,)
                                          : const Icon(Icons.visibility_off,color: Colors.white,),
                                      color:
                                          const Color.fromARGB(255, 28, 27, 27),
                                      onPressed: () {
                                        setState(() {
                                          hideMoney = !hideMoney;
                                        });
                                      },
                                    ),
                                  ]),]
                                ),
                                ),

                              ],
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text('sdd'),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
