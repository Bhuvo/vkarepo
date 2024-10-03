import 'package:flutter/material.dart';

class MTheme {
  static const Color TEXTFIELD_COLOR = Colors.white;
  static const Color BUTTON_COLOR = Colors.amber;
  static const Color ICON_COLOR = Colors.amber;
  static const double RADIUS = 8;
  static const Color THEME_COLOR = Color(0xff35b8b0);
  static const Gradient GRADIENT = LinearGradient(
      colors: [Color(0xff35b8b0), Color(0xff35b8b0)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);
  static List<BoxShadow> SHADOW_LIGHT = [
    BoxShadow(
        color: Colors.grey.withOpacity(0.25), blurRadius: 3, spreadRadius: 3)
  ];

  static final ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      //fontFamily: 'Metropolis',
      //scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      dividerTheme:
          const DividerThemeData(endIndent: 10, indent: 10, thickness: 0.5
              //color: Colors.grey,
              ),
      popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RADIUS))),
      checkboxTheme:
          const CheckboxThemeData(side: BorderSide(color: THEME_COLOR)),
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: TEXTFIELD_COLOR,
          iconColor: ICON_COLOR,
          suffixIconColor: ICON_COLOR,
          prefixIconColor: ICON_COLOR,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RADIUS),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RADIUS),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RADIUS)),
          buttonColor: BUTTON_COLOR),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            //primary: THEME_COLOR,
            textStyle: TextStyle(
                fontSize: 13, color: THEME_COLOR, fontWeight: FontWeight.w600)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              backgroundColor: BUTTON_COLOR,
              side: const BorderSide(color: Colors.white),
              // primary: Colors.black,
              textStyle:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RADIUS)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16))),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            //fontSize: 17,
          )));

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.dark,
      //fontFamily: 'Metropolis',
      //scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      dividerTheme:
          const DividerThemeData(endIndent: 10, indent: 10, thickness: 0.5
              //color: Colors.grey,
              ),
      popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RADIUS))),
      checkboxTheme:
          const CheckboxThemeData(side: BorderSide(color: THEME_COLOR)),
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: TEXTFIELD_COLOR,
          iconColor: ICON_COLOR,
          suffixIconColor: ICON_COLOR,
          prefixIconColor: ICON_COLOR,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RADIUS),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RADIUS),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RADIUS)),
          buttonColor: BUTTON_COLOR),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            // primary: THEME_COLOR,
            textStyle: TextStyle(
                fontSize: 13, color: THEME_COLOR, fontWeight: FontWeight.w600)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              backgroundColor: BUTTON_COLOR,
              side: const BorderSide(color: Colors.white),
              // primary: Colors.black,
              textStyle:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RADIUS)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16))),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            //fontSize: 17,
          )));
}
