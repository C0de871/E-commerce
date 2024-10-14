import 'package:dio/dio.dart';
import 'package:e_commerce/core/configurations/routs.dart';
import 'package:e_commerce/core/configurations/theme.dart';
import 'package:e_commerce/core/database/api/api_consumer.dart';
import 'package:e_commerce/core/database/api/dio_consumer.dart';
import 'package:e_commerce/core/database/cache/cache_helper.dart';
import 'package:e_commerce/repositories/User%20repository/user_repository.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//! Here the is start point of the app:
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // initialBinding: ServicesBinding(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

//! Method for initializing services:
Future initalServices() async {
  await Get.putAsync(()  => CacheHelperService().init());
  Get.put<ApiConsumer>(DioConsumer(dio: Dio()));
  Get.put<UserRepository>(UserRepository());
}
