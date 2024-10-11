import 'package:e_commerce/core/Custom%20Widget/social_card.dart';
import 'package:e_commerce/screens/Sign%20Up/components/sign_up_form.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(20, context)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            Text(
              'Register Account',
              style: TextStyle(
                fontSize: SizeConfig.relativeHeight(28, context),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const Text(
              'Complete your detailes or continue\n with social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.07),
            const SignUpForm(),
            SizedBox(height: SizeConfig.screenHeight! * 0.07),
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
            const Text('By continuing, you agree to our\nTerms of Service and Privacy Policy.', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
