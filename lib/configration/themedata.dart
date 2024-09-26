import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDataProvider {
  // static const mainAppDarkColor = Color.fromARGB(255, 39, 153, 144);
  static const primaryDarkThemeColor = Color.fromARGB(255, 255, 255, 255);

  static const primaryDarkCardThemeColor = Color(0xFFEFE0FF);
  static const primaryDarkCardEndThemeColor = Color(0xFF440687);
  static const textDarkThemeColor = Colors.white;
  static const textWrongColor = Colors.red;

  static const primaryDarkThemeSecTextColor = Color.fromARGB(255, 2, 2, 2);
  static const primaryDarkThemeButtonColor = Color(0xFFF9B091);
  static const textDarksecThemeColor = Color.fromARGB(255, 66, 57, 131);

  static const backgroundDarkColor = Color(0xFF040C23);
  static const greyLightColor = Color(0xFF858597);
  static const unselectedColor = Color(0xFFB8B8D2);

  static const greyDarkColor = Color(0xFF3F3F46);
  static const imageBackgroundLight = "assets/images/blight.png";
  static const imageBackgroundDark = "assets/images/bdark.png";
  static const imageBackgroundLightWeb = "assets/images/blight-web.png";
  static const imageBackgroundDarkWeb = "assets/images/bdark-web.png";

  static const darkBlueText = Color(0xFF1F1F39);

  static const mainAppColor = Color(0xFF3D5CFF);
  static const textLightThemeColor = Color.fromARGB(255, 255, 255, 255);
  static const buttonDisableColor = Color(0xFFF9FAFB);
    static const floatButtonColor = Color(0xFFEAEAFF);


  static const backgroundLightColor = Colors.white;
  static const blueLightColor = Color(0xffCEECFE);
  static const greenLightColor = Color(0xffBFE4C6);

  static const orangeColor = Color(0xffFF6905);

  static const primaryLightThemeColor = Color.fromARGB(148, 217, 217, 217);

  static const borderColor = Color(0xFFF4F3FD);
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
          displaySmall: GoogleFonts.poppins(
            color: ThemeDataProvider.textDarksecThemeColor,
            fontSize: 10,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: GoogleFonts.poppins(
            color: ThemeDataProvider.textLightThemeColor,
            fontSize: 25,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.poppins(
            color: ThemeDataProvider.textLightThemeColor,
            fontSize: 13,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w500,
          )),
      drawerTheme: DrawerThemeData(
        backgroundColor: backgroundDarkColor,
        scrimColor: textLightThemeColor.withOpacity(0.5),
        elevation: 10,
      ),
      switchTheme: SwitchThemeData(
          splashRadius: 100,
          thumbColor: WidgetStateProperty.all(primaryDarkThemeColor),
          trackColor: WidgetStateProperty.resolveWith((states) =>
              states.contains(WidgetState.selected)
                  ? backgroundDarkColor
                  : null)),
      cardColor: primaryDarkThemeColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: mainAppColor,
        unselectedItemColor: unselectedColor,
        backgroundColor: textLightThemeColor,
      ),
      scaffoldBackgroundColor: backgroundLightColor,
      appBarTheme: const AppBarTheme(
          color: ThemeDataProvider.mainAppColor,
          elevation: 0,
          titleTextStyle:
              TextStyle(color: textDarkThemeColor, fontWeight: FontWeight.w400),
          iconTheme: IconThemeData(color: textDarksecThemeColor)),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, modalBackgroundColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          //textStyle: WidgetStateProperty.all(TextStyle(color)),
          backgroundColor: WidgetStateProperty.all(mainAppColor),
          minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.sizeOf(context).width, 50)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(
                color: primaryLightThemeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
  //static final lightTheme = ;

  static final darkTheme = ThemeData(
    textTheme: TextTheme(
        displaySmall: GoogleFonts.poppins(
          color: ThemeDataProvider.textDarksecThemeColor,
          fontSize: 10,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
        ),
        displayLarge: GoogleFonts.poppins(
          color: ThemeDataProvider.textDarkThemeColor,
          fontSize: 25,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          color: ThemeDataProvider.textDarkThemeColor,
          fontSize: 13,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w500,
        )),
    drawerTheme: DrawerThemeData(
      backgroundColor: backgroundDarkColor,
      scrimColor: textLightThemeColor.withOpacity(0.5),
      elevation: 10,
    ),
    switchTheme: SwitchThemeData(
        splashRadius: 100,
        thumbColor: WidgetStateProperty.all(primaryDarkThemeColor),
        trackColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? backgroundDarkColor
                : null)),
    cardColor: primaryDarkThemeColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryDarkThemeColor,
        unselectedItemColor: textDarksecThemeColor,
        backgroundColor: primaryDarkThemeSecTextColor),
    scaffoldBackgroundColor: backgroundDarkColor,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: primaryDarkThemeColor,
      modalBackgroundColor: primaryDarkThemeColor,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: textDarkThemeColor,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: primaryDarkThemeColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle:
            WidgetStateProperty.all(const TextStyle(fontWeight: FontWeight.bold)),
        foregroundColor: WidgetStateProperty.all(primaryDarkThemeSecTextColor),
        backgroundColor: WidgetStateProperty.all(primaryDarkThemeButtonColor),
        minimumSize: WidgetStateProperty.all(const Size(150, 40)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: const BorderSide(
              color: primaryDarkThemeButtonColor,
            ),
          ),
        ),
      ),
    ),
  );
}
