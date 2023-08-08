import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class SettingTab extends StatefulWidget {
  SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  var backgroundColor = Color.fromRGBO(101, 0, 56, 1.0);
  var fontFamily = 'Rubik-VariableFont_wght';
  var buttonPadding =
      EdgeInsets.only(bottom: 1.h, top: 1.h, left: 4.w, right: 4.w);

  TextStyle getButtonStyle() {
    return TextStyle(
      fontFamily: fontFamily,
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 18.sp,
    );
  }

  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.sp),
      borderSide:
          BorderSide(color: Color.fromRGBO(101, 0, 56, 1.0), width: 1.w));

  final ImagePicker picker = ImagePicker();
  XFile? image;

  Future<void> getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: PopupMenuButton(
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                    height: 4.h,
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Reset Profile',
                                          style: TextStyle(
                                              fontFamily: fontFamily,
                                              fontWeight: FontWeight.w600),
                                        )))
                              ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              // backgroundColor: Colors.grey,
                              radius: 39.sp,
                              child: image != null
                                  ? CircleAvatar(
                                      backgroundImage:
                                          FileImage(File(image!.path)),
                                      radius: 50.sp,
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        size: 55.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                            ),
                            SizedBox(height: 3.h),
                            TextButton(
                              onPressed: () {
                                getImage();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(backgroundColor),
                              ),
                              child: Padding(
                                padding: buttonPadding,
                                child: Text('Select', style: getButtonStyle()),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      hintText: " Set user name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      fillColor: Colors.white),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      hintText: " Add funds",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      fillColor: Colors.white),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        backgroundColor),
                                  ),
                                  child: Padding(
                                    padding: buttonPadding,
                                    child:
                                        Text('Save', style: getButtonStyle()),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }
}
