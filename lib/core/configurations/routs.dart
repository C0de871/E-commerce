import 'package:e_commerce/screens/Complete%20Profile/complete_profile_screen.dart';
import 'package:e_commerce/screens/Forgot%20Password/forgot_password_screen.dart';
import 'package:e_commerce/screens/Login%20Success/login_success_screen.dart';
import 'package:e_commerce/screens/Sign%20Up/sign_up_screen.dart';
import 'package:e_commerce/screens/SignIn/sign_in_screen.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

//! routes of the app:
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (constext) => const SplashScreen(),
  SignInScreen.routeName: (constext) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (constext) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (constext) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (constext) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (constext) => const CompleteProfileScreen(),
};
