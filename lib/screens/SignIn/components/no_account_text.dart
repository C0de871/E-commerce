import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/screens/Sign%20Up/sign_up_screen.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: SizeConfig.relativeWidth(16, context),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: SizeConfig.relativeWidth(16, context),
              color: kPrimaryColor,
              decoration: TextDecoration.underline,
              decorationColor: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
