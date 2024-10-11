import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/Custom%20Widget/Pin%20Put%20Template/only_bottom_cursor_pin_put.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
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
            // RoundedWithCustomCursor(),
            // Filled()
            // RoundedWithShadow(),
            // FilledRoundedPinPut(),
            const OnlyBottomCursor(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.15,
            ),
            DefaultButton(text: 'Continue', press: () {}),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            GestureDetector(
              onTap: (){
                //todo: resend OTP code!
              },
              child: const Text(
                'Resend OTP Code',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
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

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late List<FocusNode> focusNodes;
  late List<bool> canRequestFocus;

  @override
  void initState() {
    focusNodes = List.generate(6, (index) => FocusNode());
    canRequestFocus = List.generate(6, (index) => index == 0);
    super.initState();
  }

  @override
  void dispose() {
    focusNodes.clear();
    canRequestFocus.clear();
    super.dispose();
  }

  Future<void> nextField(String value, int index) async {
    if (value.isNotEmpty && index < focusNodes.length - 1) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          focusNodes.length,
          (index) {
            return Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 70),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextFormField(
                    focusNode: focusNodes[index],
                    autofocus: index == 0,
                    // canRequestFocus: canRequestFocus[index],
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                    maxLength: 1,
                    buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) {
                      return null; // Hide the counter text
                    },
                    onChanged: (String value) async {
                      await nextField(value, index);
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      enabledBorder: outlineInputBorder(),
                      focusedBorder: outlineInputBorder(),
                      border: outlineInputBorder(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: kTextColor),
      borderRadius: BorderRadius.circular(15),
    );
  }
}

