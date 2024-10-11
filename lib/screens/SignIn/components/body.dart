import 'package:e_commerce/core/Custom%20Widget/social_card.dart';
import 'package:e_commerce/screens/SignIn/components/no_account_text.dart';
import 'package:e_commerce/screens/SignIn/components/sign_form.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.relativeWidth(20, context),
          ),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.relativeWidth(28, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Sing in with your email and password\nor continue with social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                const SignInForm(),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/google-icon.svg',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/twitter.svg',
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.relativeHeight(20, context)),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

