import 'dart:io';
import '../../../Storage/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:bank_app/globalDialogs/dialogs/addmore_funds.dart';



class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  TextEditingController userFunds = TextEditingController();
  TextEditingController userName = TextEditingController();

  @override
  void initState() {
    super.initState();
    openHiveBox();
    openHiveBoxImage();
  }

  // Open Hive box for user storage
  Future<void> openHiveBox() async {
    userStorage = await Hive.openBox<UserStorage>('userBox');
  }

  // Write data
  Future<void> writeUserData() async {
    String fundsText = userFunds.text.replaceAll(',', '');
    int fundsValue = int.tryParse(fundsText) ?? 0;

    if (userName.text.isNotEmpty) {
      const userStorageKey = 'userName_Funds';
      final userStorageData = UserStorage(
        name: userName.text,
        funds: fundsValue,
      );

      await userStorage.put(userStorageKey, userStorageData);
    }
  }

  // Open Hive box for image
  Future<void> openHiveBoxImage() async {
    userStorageImage = await Hive.openBox<UserStorageImage>('userBoxImage');
  }

  final ImagePicker picker = ImagePicker();
  XFile? image;

  // get image from user phone storage
  Future<void> getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedFile;
    });
  }

// Save Image
  Future<void> saveUserDataImage() async {
    final XFile? imagePath = image;

    if (imagePath == null) return;
    Uint8List imageBytes = await imagePath.readAsBytes();

    const userStorageKey1 = 'userNameImage';
    final userStorageImage1 = UserStorageImage(
      userImage: imageBytes,
    );

    // Use userStorageImage box to put data
    await userStorageImage.put(userStorageKey1, userStorageImage1);
  }

  // DeleteData
  Future<void> deleteUserData() async {
    userStorage.clear();
    receiverStorage.clear();
    userFunds.clear();
    userName.clear();
    userStorageImage.clear();
  }

  @override
  void dispose() {
    userFunds.dispose();
    userName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: PopupMenuButton(
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  height: 4.h,
                                  child: GestureDetector(
                                    onTap: () async {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AddMoreFunds();
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 5.w, top: 1.h),
                                      child: Text(
                                        'Add more funds',
                                        style: textStyle.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 5.w),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  height: 4.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 1.h),
                                          child: Divider(
                                            color: blackColor,
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.w, top: 1.h, bottom: 1.h),
                                        child: GestureDetector(
                                          onTap: () async {
                                            await deleteUserData();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    snackbarBackgroundColor,
                                                content: Text(
                                                    "All data have been deleted successfully",
                                                    style: TextStyle(
                                                        color: whiteColor,
                                                        fontFamily:
                                                            fontFamily)),
                                                duration: const Duration(seconds: 2),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Reset Profile',
                                            style: textStyle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 5.w),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                        color: whiteColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        size: 55.sp,
                                        color: grayColor,
                                      ),
                                    ),
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    getImage();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        appBackgroundColor),
                                  ),
                                  child: Padding(
                                    padding: buttonPadding,
                                    child: Text('Select',
                                        style: textStyle.copyWith(
                                            fontSize: 18.sp,
                                            color: whiteColor)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    saveUserDataImage();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            snackbarBackgroundColor,
                                        content: Text(
                                            "Image saved Successfully",
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontFamily: fontFamily)),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        appBackgroundColor),
                                  ),
                                  child: Padding(
                                    padding: buttonPadding,
                                    child: Text('Save Image',
                                        style: textStyle.copyWith(
                                            fontSize: 18.sp,
                                            color: whiteColor)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextFormField(
                                  controller: userName,
                                  decoration: InputDecoration(
                                      focusColor: whiteColor,
                                      hintText: " Set user name",
                                      hintStyle: TextStyle(
                                          color: grayColor),
                                      focusedBorder: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      fillColor: whiteColor),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextFormField(
                                  controller: userFunds,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [ThousandsFormatter()],
                                  decoration: InputDecoration(
                                      focusColor: whiteColor,
                                      hintText: " Add funds",
                                      hintStyle: TextStyle(
                                          color: grayColor),
                                      focusedBorder: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      fillColor: whiteColor),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextButton(
                                  onPressed: () async {
                                    // calling my funtion to write data to hive
                                    await writeUserData();
                                    // Check if data is added to Hive storage
                                    if (userFunds.text.isEmpty ||
                                        userName.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor:
                                              snackbarBackgroundColor,
                                          content: Text("Inputs are required",
                                              style: TextStyle(
                                                  color: whiteColor,
                                                  fontFamily: fontFamily)),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      if (userStorage
                                          .containsKey('userName_Funds')) {
                                        final storedData =
                                            userStorage.get('userName_Funds');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor:
                                                snackbarBackgroundColor,
                                            content: Text("Successfully Saved",
                                                style: TextStyle(
                                                    color: whiteColor,
                                                    fontFamily: fontFamily)),
                                            duration: const Duration(seconds: 2),
                                          ),
                                        );
                                        print(
                                            'Stored Data: ${storedData?.name}, ${storedData?.funds}');
                                        userFunds.clear();
                                        userName.clear();
                                      }
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        appBackgroundColor),
                                  ),
                                  child: Padding(
                                    padding: buttonPadding,
                                    child: Text('Save',
                                        style: textStyle.copyWith(
                                            fontSize: 18.sp,
                                            color: whiteColor)),
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
