import 'package:e_commerce/core/App/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}