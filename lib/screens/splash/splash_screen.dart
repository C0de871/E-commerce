import 'package:e_commerce/screens/splash/components/body.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
