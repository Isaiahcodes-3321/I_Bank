import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Animations/loadtoDashboard.dart';
import '../Constant/Themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidepassword = true;
  var getUserName = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
            color: const Color.fromRGBO(101, 0, 56, 1.0),
            child: Stack(children: [
              Row(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                      flex: 2,
                      child: Image.asset("images/logoDesign.png",
                          fit: BoxFit.cover))
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
                                        style: const TextStyle(color: Colors.white),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter phone number';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(color: Colors.white),
                                            focusColor: Colors.white,
                                            hintText: " Phone number",
                                            hintStyle:
                                                const TextStyle(color: Colors.grey),
                                            prefixIcon: const Icon(
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
                                        style: const TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          
                                          errorStyle: const TextStyle(color: Colors.white),
                                            hintText: "Password",
                                            hintStyle:
                                                const TextStyle(color: Colors.grey),
                                            prefixIcon: const Icon(
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
        floatingActionButton: SizedBox(
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
              backgroundColor: Colors.white,
              child: Text('Login',
                  style: textStyle.copyWith(fontSize: 16.sp)),
            ),
          ),
        ),
      ),
    );
  }
}
