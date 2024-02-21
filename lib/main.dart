import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/config/theme.dart';
import 'app/tools/functions/firebase.dart';
import 'app/tools/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeController();
  await firebaseInitializeApp();

  //with device preview for checking on different screen sizes
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));

  //without device preview|| uncomment this code and comment the above line
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final theme = ThemeController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      title: 'Demo App',
      theme: theme.themeData,
      darkTheme: theme.darkThemeData,
      themeMode: theme.darkMode ? ThemeMode.dark : ThemeMode.light,
      getPages: Pages.pages,
      initialRoute: Pages.initialRoute,
    );
  }
}
