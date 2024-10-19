import 'package:e_commerce/core/configurations/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//! theme:
ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

//! InputDecoration theme:
InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // labelStyle: const TextStyle(color: Colors.black),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.focused)) return const TextStyle(color: Colors.blue);
      return const TextStyle();
    }),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

//! text theme:
TextTheme textTheme() {
  return const TextTheme(
    titleLarge: TextStyle(color: Color(0xff8b8b8b)), //! I added this
    bodySmall: TextStyle(color: kTextColor),
    bodyMedium: TextStyle(color: kTextColor),
    bodyLarge: TextStyle(color: kTextColor),
  );
}

//! appBar theme:
AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Color(0xFF9B9B9B),
    ),
  );
}
