import 'package:e_commerce/controllers/Verification%20code/verification_code_controller.dart';
import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/Custom%20Widget/Pin%20Put%20Template/only_bottom_cursor_pin_put.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends GetView<VerificationCodeController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final String? email = Get.arguments;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.relativeWidth(20, context),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            Text('OTP Verfication', style: TextStyle(fontSize: SizeConfig.relativeHeight(28, context), fontWeight: FontWeight.bold, color: Colors.black, height: 1.5)),
            Text('We sent a verfication code to $email.', textAlign: TextAlign.center),
            buildTimer(),
            SizedBox(height: SizeConfig.screenHeight! * 0.15),
            const OnlyBottomCursor(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.15,
            ),
            Obx(
              () {
                return controller.verfiyCodeLoadingState.value == VerfiyCodeLoadingState.loading
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          DefaultButton(text: 'Continue', press: () {
                            controller.verifyCode();
                          }),
                          SizedBox(height: SizeConfig.screenHeight! * 0.1),
                          GestureDetector(
                            onTap: () {
                              //todo: resend OTP code!
                            },
                            child: const Text(
                              'Resend OTP Code',
                              style: TextStyle(decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You can resent code in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            '00:${value.toInt()}',
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}


            // RoundedWithCustomCursor(),
            // Filled()
            // RoundedWithShadow(),
            // FilledRoundedPinPut(),