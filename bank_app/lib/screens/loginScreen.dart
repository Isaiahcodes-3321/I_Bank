import 'package:flutter/material.dart';
import 'package:bank_app/widgets/Themes.dart';
import '../globalDialogs/loadto_dashboard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  var getUserName = TextEditingController();
  final formKey = GlobalKey<FormState>();

//  input sizedBox
  var sizedBox = SizedBox(height: 3.h);
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.sp),
      borderSide: BorderSide(color: whiteColor, width: 1.w));



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: appBackgroundColor,
            leadingWidth: double.infinity,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: Text(
                  'Welcome ',
                  style: textStyle.copyWith(
                    color: whiteColor,
                  ),
                ),
              ),
            )),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Container(
            color: appBackgroundColor,
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
                                    style: textStyle.copyWith(
                                        fontSize: 30.sp, color: whiteColor)),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        style: TextStyle(
                                            color: whiteColor),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter phone number';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            errorStyle: TextStyle(
                                                color: whiteColor),
                                            focusColor: whiteColor,
                                            hintText: " Phone number",
                                            hintStyle: TextStyle(
                                                color: grayColor),
                                            prefixIcon: Icon(
                                                Icons.man_4_outlined,
                                                color: whiteColor),
                                            focusedBorder: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            fillColor: whiteColor),
                                      ),
                                      sizedBox,
                                      TextFormField(
                                        obscureText: hidePassword,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter some text";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                            color: whiteColor),
                                        decoration: InputDecoration(
                                            errorStyle: TextStyle(
                                                color: whiteColor),
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: grayColor),
                                            prefixIcon:  Icon(
                                                Icons.lock_person_rounded,
                                                color: whiteColor),
                                            suffixIcon: IconButton(
                                              icon: hidePassword
                                                  ?  Icon(Icons.visibility,
                                                      color: whiteColor)
                                                  : Icon(
                                                      Icons.visibility_off,
                                                      color: whiteColor),
                                              color: const Color.fromARGB(
                                                  255, 28, 27, 27),
                                              onPressed: () {
                                                setState(() {
                                                  hidePassword = !hidePassword;
                                                });
                                              },
                                            ),
                                            focusedBorder: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            fillColor: whiteColor),
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
              backgroundColor: whiteColor,
              child: Text('Login', style: textStyle.copyWith(fontSize: 16.sp)),
            ),
          ),)
        ),
    );
  }
}
