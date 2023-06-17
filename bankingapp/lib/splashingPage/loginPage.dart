import 'package:bankingapp/loadTimeScreen/loadAnimationTime.dart';
import 'package:bankingapp/screen/DashBoardPage/darshBoard.dart';
import 'package:bankingapp/splashingPage/smsMessage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Login_Page extends StatefulWidget {
  Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  bool hidepassword = true;
  var getUserName = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromRGBO(101, 0, 56, 1.0),
            leadingWidth: double.infinity,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Welcome',
                  style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700),
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
                  height: double.infinity,
                  width: double.infinity,
                  child: Column( 
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text('Login',
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 25,
                              ),
                              SingleChildScrollView(
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        style: TextStyle(color: Colors.white),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        controller: getUserName,
                                        decoration: InputDecoration(
                                            focusColor: Colors.white,
                                            hintText: " Name",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(Icons.man_4_outlined,
                                                color: Colors.white),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 5)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 5)),
                                            fillColor: Colors.white),
                                      ),
                                      SizedBox(height: 20),
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
                                            focusColor: Colors.white,
                                            hintText: " Phone number",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(Icons.man_4_outlined,
                                                color: Colors.white),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 5)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 5)),
                                            fillColor: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
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
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 5)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 5)),
                                            fillColor: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return SmsPasssword();
                                              },
                                            );
                                          },
                                          child: Text('Forgot Password?',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationThickness: 3)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (context) {
                  return LoadAnimation(getUsername: getUserName,);
                },
              );
            }
          },
          child: Text('Login',
              style: TextStyle(
                  color: Color.fromRGBO(101, 0, 56, 1.0),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800)),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
