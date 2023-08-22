import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Animations/loadtoDashboard.dart';
import '../Constant/Themes.dart';

class Login_Page extends StatefulWidget {
  Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  bool hidepassword = true;
  var getUserName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var fontFamily = 'BodoniModa-VariableFont_opsz,wght';

//  input sizedBox
  var sizedBox = SizedBox(height: 3.h);
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.sp),
      borderSide: BorderSide(color: Colors.white, width: 1.w));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: backgroundColor,
            leadingWidth: double.infinity,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: Text(
                  'Welcome ',
                  style: textStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            )),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Container(
            color: Color.fromRGBO(101, 0, 56, 1.0),
            child: Stack(children: [
              Row(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Image.asset("images/logoDesign.png",
                            fit: BoxFit.cover),
                      ))
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(20.sp),
                          child: SingleChildScrollView(
                            // physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text('Login',
                                    style: textStyle.copyWith(fontSize: 30.sp,color: Colors.white)),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        style: TextStyle(color: Colors.white),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter phone number';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(color: Colors.white),
                                            focusColor: Colors.white,
                                            hintText: " Phone number",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(
                                                Icons.man_4_outlined,
                                                color: Colors.white),
                                            focusedBorder: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            fillColor: Colors.white),
                                      ),
                                      sizedBox,
                                      TextFormField(
                                        obscureText: hidepassword,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter some text";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          
                                          errorStyle: TextStyle(color: Colors.white),
                                            hintText: "Password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(
                                                Icons.lock_person_rounded,
                                                color: Colors.white),
                                            suffixIcon: IconButton(
                                              icon: hidepassword
                                                  ? const Icon(Icons.visibility,
                                                      color: Colors.white)
                                                  : const Icon(
                                                      Icons.visibility_off,
                                                      color: Colors.white),
                                              color: const Color.fromARGB(
                                                  255, 28, 27, 27),
                                              onPressed: () {
                                                setState(() {
                                                  hidepassword = !hidepassword;
                                                });
                                              },
                                            ),
                                            focusedBorder: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            fillColor: Colors.white),
                                      ),
                                      sizedBox,
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: GestureDetector(
                                          onTap: () {
                                          },
                                          child: Text('Forgot Password?',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: fontFamily,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationThickness: 3.sp)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // this will make the keyboard not to cover the textfield when user is typing
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom))
                    ],
                  ))
            ]),
          ),
        ),
        floatingActionButton: Container(
          height: 16.h,
          width: 16.w,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoadDasboard(),
                    ),
                  );
                }
              },
              child: Text('Login',
                  style: textStyle.copyWith(fontSize: 16.sp)),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
