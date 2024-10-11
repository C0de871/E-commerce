import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color(0xFFFF7643);
  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );

  static const kSecondaryColor = Color(0xFF979797);
  static const kTextColor = Color(0xFF757575);
}

class AppConstants {
  static const kAnimationDuration = Duration(milliseconds: 200);
  static const double defaultPadding = 8;

  // Form Errors:
  static final RegExp emailValidatorRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = 'Email is required';
  static const String kInvalidEmailError = 'Email isn\'t valid';
  static const String kPasswordNullError = 'Password is required';
  static const String kShortPasswordError = 'Password must be at least 8 characters long';
  static const String kMatchPasswordError = 'Passwords don\'t match';
  static const String kNameNullError = 'Name is required';
  static const String kPhoneNumberNullError = 'Phone number is required';
  static const String kAddressNullError = 'Address is required';
}

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const double defaultPadding = 8;

//Form Erros:
final RegExp emailValidatorRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = 'Email is required';
const String kInvalidEmailError = 'Email isn\'t valid';
const String kPasswordNullError = 'Password is required';
const String kshortpasswordError = 'Password must be at least 8 characters long';
const String kMatchPasswordError = 'Passwords don\'t match';
const String kfirstNameNullError = 'First Name is required';
const String kPhoneNumberNullError = 'Phone number is required';
const String kAddressNullError = 'Address is required';

class Constants {}
