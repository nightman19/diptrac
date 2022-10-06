import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import '../constants.dart';

class DiptracTheme extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: textColorLightTheme,
    ),
    headline1: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: textColorLightTheme,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: textColorLightTheme,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: textColorLightTheme,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: textColorLightTheme,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: textColorDarkTheme,
    ),
    headline1: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: textColorDarkTheme,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: textColorDarkTheme,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: textColorDarkTheme,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: textColorDarkTheme,
    ),
  );

    static ThemeData light() {
      return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        primaryColor: primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData
            .light()
            .textTheme),
        elevatedButtonTheme: elevatedButtonThemeData,
        colorScheme: ThemeData
            .light()
            .colorScheme
            .copyWith(secondary: secondaryColorLightTheme),
      );
    }
    static ThemeData dark(){
      return ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColorDarkTheme,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        elevatedButtonTheme: elevatedButtonThemeData,
        colorScheme: ThemeData.dark()
            .colorScheme
            .copyWith(secondary: secondaryColorDarkTheme),
      );
    }
  }



final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.all(defaultPadding),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(defaultBorderRadius),
      ),
    ),
  ),
);
