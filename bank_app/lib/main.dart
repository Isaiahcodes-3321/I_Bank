import 'model/receiverDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:bank_app/widgets/Themes.dart';
import 'package:bank_app/Storage/person.dart';
import 'screens/splashScreen/splashScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  await setupHive();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

// setting up hive
Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserStorageAdapter());
  Hive.registerAdapter(ReceiverStorageAdapter());
  Hive.registerAdapter(UserStorageImageAdapter());
  await openHiveBoxes();
}

// opening the hive storage for receiverStorage and UserStorage
Future<void> openHiveBoxes() async {
  userStorage = await Hive.openBox<UserStorage>('userBox');
  receiverStorage = await Hive.openBox<ReceiverStorage>('receiverBox');
  userStorageImage = await Hive.openBox<UserStorageImage>('userBoxImage');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Date(),
        ),
        ChangeNotifierProvider(create: (_) => ReceiverDetails()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: SafeArea(child: SplashScreen()),
            ),
          );
        },
      ),
    );
  }
}
