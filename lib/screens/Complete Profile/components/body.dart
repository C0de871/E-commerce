import 'package:e_commerce/screens/Complete%20Profile/components/complete_profile_form.dart';
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
              'Complete Profile',
              style: TextStyle(
                fontSize: SizeConfig.relativeHeight(28, context),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const Text(
              'Complete Your details or continue\nwith socical media',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            const CompleteProfileForm(),
            SizedBox(height: SizeConfig.relativeHeight(40, context)),
            const Text(
              'By continuing you confirm that you agree\nwith our Terms & Conditions',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
