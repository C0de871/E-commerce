import 'package:e_commerce/screens/SignIn/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
        ),
      ),
      body: const Body(),
    );
  }
}
