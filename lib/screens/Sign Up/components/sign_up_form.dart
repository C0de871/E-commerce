import 'package:e_commerce/core/Custom%20Widget/custom_suffix_icon.dart';
import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/Custom%20Widget/form_error.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/controllers/sign_up_controller.dart';
import 'package:e_commerce/screens/Complete%20Profile/complete_profile_screen.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? email, password, confirmPassword;

  SignUpController controller = Get.put(SignUpController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signUpformKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          buildPasswordFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          buildConfirmPasswordFormField(),
          Obx(() {
            return FormError(errors: controller.signUpErrors.toList());
          }),
          // FormError(errors: controller.signUpErrors),
          SizedBox(height: SizeConfig.relativeHeight(40, context)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (controller.signUpformKey.currentState!.validate()) {
                controller.signUpformKey.currentState!.save();
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: controller.signUpConfirmedPassword,
      onSaved: (newValue) => confirmPassword = newValue,
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          return '';
        } else if (password != confirmPassword) {
          controller.addSignUpError(error: kMatchPasswordError);
          return '';
        }
        return null;
      },
      onChanged: (value) {
        confirmPassword = value;
        if (password == confirmPassword) {
          controller.removeSignUpError(error: kMatchPasswordError);
        }
      },
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: controller.signUpPassword,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          controller.addSignUpError(error: kPasswordNullError);
          return '';
        } else if (value.isNotEmpty && value.length < 8) {
          controller.addSignUpError(error: kshortpasswordError);
          return '';
        }
        return null;
      },
      onChanged: (value) {
        password = value;
        if ((value.isNotEmpty)) {
          controller.removeSignUpError(error: kPasswordNullError);
        } else if ((value.isEmpty || value.length >= 8)) {
          controller.removeSignUpError(error: kshortpasswordError);
        }
      },
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: controller.signUpEmail,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeSignUpError(error: kEmailNullError);
        }
        if (((emailValidatorRegex.hasMatch(value) || value.isEmpty))) {
          controller.removeSignUpError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          controller.addSignUpError(error: kEmailNullError);
          // print('empty email');
          return '';
        } else if (value.isNotEmpty && !emailValidatorRegex.hasMatch(value)) {
          controller.addSignUpError(error: kInvalidEmailError);
          // print('invalid email');
          return '';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Mail.svg'),
      ),
    );
  }
}
