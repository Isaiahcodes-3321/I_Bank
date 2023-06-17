import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SmsPasssword extends StatelessWidget {
  const SmsPasssword({super.key});



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(101, 0, 56, 1.0),
      content: Container(
          height: 200,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Type in your registration number',
                      style:
                          TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700,color: Colors.white)),
                  TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        hintText: " Number ",
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.w)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.w)),
                        fillColor: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        )),
                  )
                ]),
          )),
    );
  }
}
