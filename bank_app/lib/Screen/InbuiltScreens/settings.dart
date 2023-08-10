import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import '../../Constant/Themes.dart';
import '../../Constant/reUsedTextField.dart';

class SettingTab extends StatefulWidget {
  SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
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
                                          style: textStyle.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 5.w),
                                        )))
                              ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 6.w, left: 6.w, top: 2.h),
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
                                child: Text('Select',
                                    style: textStyle.copyWith(
                                        fontSize: 18.sp, color: Colors.white)),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                               
                                TextFormField(
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      hintText: " Set user name",
                                      hintStyle: TextStyle(color: const Color.fromARGB(255, 104, 104, 104)),
                                      focusedBorder: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      fillColor: Colors.white),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      hintText: " Add funds",
                                      hintStyle: TextStyle(color: const Color.fromARGB(255, 104, 104, 104)),
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
                                    child: Text('Save',
                                        style: textStyle.copyWith(
                                            fontSize: 18.sp,
                                            color: Colors.white)),
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
            // To avoid Keyboard from covering the input when user type
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }
}
