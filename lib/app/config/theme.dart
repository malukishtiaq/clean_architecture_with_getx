import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  factory ThemeController() {
    if (Get.isRegistered<ThemeController>()) {
      return Get.find<ThemeController>();
    } else {
      return Get.put(ThemeController._());
    }
  }

  ThemeController._();

  bool get darkMode => Get.isDarkMode;

  void toggleMode() {
    final isDarkMode = Get.isDarkMode;

    if (isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      setupStatusBarColor(false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      setupStatusBarColor(true);
    }

    update();
  }

  void setupStatusBarColor(bool isDarkMode) {
    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
  }

  TextStyle get commonStyle => const TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      );

  TextTheme get textTheme {
    return TextTheme(
      displayLarge: commonStyle.copyWith(fontSize: 48),
      displayMedium: commonStyle.copyWith(fontSize: 40),
      displaySmall: commonStyle.copyWith(fontSize: 28),
      headlineMedium: commonStyle.copyWith(fontSize: 26),
      headlineSmall: commonStyle.copyWith(fontSize: 24),
      titleLarge: commonStyle.copyWith(fontSize: 22),
      titleMedium: commonStyle.copyWith(fontSize: 20),
      titleSmall: commonStyle.copyWith(fontSize: 16),
      labelLarge: commonStyle.copyWith(fontSize: 14),
      bodyLarge: commonStyle.copyWith(fontSize: 12),
    );
  }

  ///Not modify background & onBackground
  ThemeData get themeData {
    return ThemeData(
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFFFFFF),
        onPrimary: const Color(0xFF9600FF),
        primary: const Color(0xFF300151),
        secondary: const Color(0xFF1A1B1E),
        tertiary: const Color(0xFF474A54),
        outline: const Color.fromARGB(255, 187, 187, 187),
        outlineVariant: const Color(0xFFE3E3E3),
        onInverseSurface: const Color(0xFF0572D2),
        inversePrimary: const Color(0xffEAF5FF),
        primaryContainer: const Color(0xFF06B576),
        scrim: const Color(0xFFEBEBEB),
        surfaceTint: const Color(0xFF606061),
        shadow: const Color(0xFF383E45),
        secondaryContainer: const Color.fromRGBO(255, 255, 255, 0.5 / 255.0),
        inverseSurface: Colors.transparent,
        error: const Color(0xFFF00000),
        onPrimaryContainer: const Color(0xFFFAFAFA),
        surface: const Color(0xFF7ACAFF),
        tertiaryContainer: const Color(0xFF383D45),
        onSecondary: const Color(0xFF616161),
        onSurfaceVariant: const Color(0xFF4FB9FF),
        onTertiary: const Color(0xFF328BDA),
        onSecondaryContainer: const Color(0xFFE0E0E0),
        onTertiaryContainer: const Color(0xFF007AFF),
      ),
      navigationBarTheme: navigationBarThemeLight,
    );
  }

  //TODO(sb): add dark colors.

  ///Not modify background & onBackground
  ///Please don't overwrite current colors
  ThemeData get darkThemeData {
    return ThemeData(
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xFFFFFFFF),
        onPrimary: const Color(0xFF9600FF),
        primary: const Color(0xFF300151),
        secondary: const Color(0xFF1A1B1E),
        tertiary: const Color(0xFF474A54),
        outline: const Color.fromARGB(255, 187, 187, 187),
        outlineVariant: const Color(0xFFE3E3E3),
        onInverseSurface: const Color(0xFF0572D2),
        inversePrimary: const Color(0xffEAF5FF),
        primaryContainer: const Color(0xFF06B576),
        scrim: const Color(0xFFEBEBEB),
        surfaceTint: const Color(0xFF606061),
        shadow: const Color(0xFF383E45),
        secondaryContainer: const Color.fromRGBO(255, 255, 255, 0.5 / 255.0),
        inverseSurface: Colors.transparent,
        error: const Color(0xFFF00000),
        onPrimaryContainer: const Color(0xFFFAFAFA),
        surface: const Color(0xFF7ACAFF),
        tertiaryContainer: const Color(0xFF383D45),
        onSecondary: const Color(0xFF616161),
        onSurfaceVariant: const Color(0xFF4FB9FF),
        onTertiary: const Color(0xFF328BDA),
        onSecondaryContainer: const Color(0xFFE0E0E0),
        onTertiaryContainer: const Color(0xFF007AFF),
      ),
      navigationBarTheme: navigationBarThemeDark,
    );
  }

  NavigationBarThemeData get navigationBarThemeLight => NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return commonStyle.copyWith(
                fontSize: 12,
                color: const Color(0xFFFFFFFF),
              );
            }
            return commonStyle.copyWith(
              fontSize: 12,
              color: const Color(0xFFFFFFFF).withOpacity(.5),
            );
          },
        ),
      );

  NavigationBarThemeData get navigationBarThemeDark => NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return commonStyle.copyWith(
                fontSize: 12,
                color: const Color(0xFFFFFFFF),
              );
            }
            return commonStyle.copyWith(
              fontSize: 12,
              color: const Color(0xFFFFFFFF).withOpacity(.5),
            );
          },
        ),
      );
}
