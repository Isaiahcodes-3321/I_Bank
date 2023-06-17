import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TranferTab extends StatelessWidget {
  TranferTab({super.key});
  var receiverName = TextEditingController();
  var receiverAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  Color.fromRGBO(101, 0, 56, 1.0)
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Tranfer',
                style: TextStyle(
                  color: Color.fromRGBO(101, 0, 56, 1.0),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: Color.fromRGBO(101, 0, 56, 1.0),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                      key: GlobalKey<FormState>(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Account Name',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Color.fromRGBO(101, 0, 56, 1.0),
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0)),
                            controller: receiverName,
                            decoration: InputDecoration(
                                // focusColor:
                                //     const Color.fromARGB(255, 203, 8, 8),
                                hintText: " Name",
                                hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 45, 45, 45)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(101, 0, 56, 1.0),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(101, 0, 56, 1.0),
                                        width: 2)),
                                ),
                          ),
                           SizedBox(
                            height: 2.h,
                          ),
                          Text('Account Number',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Color.fromRGBO(101, 0, 56, 1.0),
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                             keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                                hintText: " Number",
                                hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 45, 45, 45)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(101, 0, 56, 1.0),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(101, 0, 56, 1.0),
                                        width: 2)),
                                ),
                          ),
                            SizedBox(
                            height: 2.h,
                          ),
                          Text('Amount',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Color.fromRGBO(101, 0, 56, 1.0),
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                             keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0)),
                            controller: receiverAmount,
                            decoration: InputDecoration(
                                hintText: " Amount",
                                hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 45, 45, 45)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(101, 0, 56, 1.0),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(101, 0, 56, 1.0),
                                        width: 2)),
                                ),
                          ),
                          SizedBox(height: 3.h,),
                          SizedBox(width: double.infinity,
                          child: Align(alignment: Alignment.bottomRight,
                          child: TextButton(onPressed: (){},
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(101, 0, 56, 1.0),
                            // shape: CircleBorder(eccentricity: ),
                            ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('Send',style: TextStyle(color: Colors.white,fontSize: 15.sp)),
                          ),)),)
                        ],
                      ))),
            )
          ]),
        )),
      ),
    );
  }
}
