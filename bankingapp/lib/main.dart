import 'package:bankingapp/provider/getUsername.dart';
import 'package:bankingapp/splashingPage/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (context) => UserName(),
    ),
    ],
    child: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Logo_page(),
        );
      },
    );
  }
}