import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
import '../../Constant/Themes.dart';
import '../../Storage/person.dart';

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

  TextEditingController userFunds = TextEditingController();
  TextEditingController userName = TextEditingController();
  late Box<UserStorage> userStorage;

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  // Open Hive box
  Future<void> openHiveBox() async {
    userStorage = await Hive.openBox<UserStorage>('userBox');
  }

  // Write data
  Future<void> writeUserData() async {
    final double fundsValue = double.tryParse(userFunds.text) ?? 0.0;
    final XFile? imagePath = image;

    if (userName.text.isNotEmpty) {
      final userStorageKey = 'userName_Funds';
      final userStorageData = UserStorage(
        name: userName.text,
        funds: fundsValue,
        userImage: imagePath,
      );

      await userStorage.put(userStorageKey, userStorageData);
    }
  }

  // DeleteData
  Future<void> deleteUserData() async {
    await userStorage.clear();
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
                                        onTap: () async {
                                          await deleteUserData();
                                          final remainingKeys =
                                              userStorage.keys.toList();
                                          if (remainingKeys.isEmpty) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text('Data Deleted'),
                                                  content: Text(
                                                      'All data has been deleted successfully.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
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
                                  controller: userName,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      hintText: " Set user name",
                                      hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 104, 104, 104)),
                                      focusedBorder: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      fillColor: Colors.white),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextFormField(
                                  controller: userFunds,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      hintText: " Add funds",
                                      hintStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 104, 104, 104)),
                                      focusedBorder: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      fillColor: Colors.white),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await writeUserData();
                                    // Check if data is added to Hive storage
                                    if (userStorage
                                        .containsKey('userName_Funds')) {
                                      final storedData =
                                          userStorage.get('userName_Funds');
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Saved Successfully',
                                                style: textStyle.copyWith(
                                                    fontSize: 23.sp,
                                                    color: Color.fromRGBO(
                                                        31, 0, 17, 1))),
                                            content: Text(
                                                'All data have been saved.',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        31, 0, 17, 1))),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK',
                                                    style: textStyle.copyWith(
                                                        fontSize: 18.sp,
                                                        color: Color.fromRGBO(
                                                            11, 172, 0, 1))),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      print(
                                          'Stored Data: ${storedData?.name}, ${storedData?.funds}');
                                    }
                                  },
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
