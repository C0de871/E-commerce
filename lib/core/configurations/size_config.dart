import 'package:flutter/material.dart';


//! method for creating adaptive app:
class SizeConfig {
  static Size? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.sizeOf(context);
    screenWidth = _mediaQueryData!.width;
    screenHeight = _mediaQueryData!.height;
    // orientation = _mediaQueryData!.orientation;
    defaultSize = screenWidth! * 0.07; // 7% of screen width
  }

  static double relativeHeight(double inputHeight, BuildContext context) {
    // double screenHeight = SizeConfig.screenHeight!;
    return (inputHeight / 812.0) * MediaQuery.sizeOf(context).height;
  }

  static double relativeWidth(double inputWidth, BuildContext context) {
    // double screenWidth = SizeConfig.screenWidth!;
    return (inputWidth / 375.0) * MediaQuery.sizeOf(context).width;
  }
}
