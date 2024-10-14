import 'package:e_commerce/controllers/Sign%20in/sign_in_controller.dart';
import 'package:e_commerce/core/Custom%20Widget/custom_suffix_icon.dart';
import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/Custom%20Widget/form_error.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/screens/Forgot%20Password/forgot_password_screen.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignInForm extends StatelessWidget {
  SignInForm({super.key});
  String? email, password;
  final SignInController controller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          buildPasswordFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          Row(
            children: [
              //! First state change:
              Obx(
                () => Checkbox(
                  value: controller.isRemebered.value,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    controller.changeRemeberedState(value);
                  },
                ),
              ),
              const Text('Remember me'),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          Obx(() => FormError(errors: controller.errors.toList())),
          SizedBox(height: SizeConfig.relativeHeight(20, context)),
          Obx(
            () => controller.signInAccountLoadingState.value == SignInLoadingState.loading
                ? const CircularProgressIndicator()
                : DefaultButton(
                    text: 'Sign In',
                    press: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.formKey.currentState!.save();
                        controller.signIn();
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: controller.emailController,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeSignInError(kEmailNullError);
        } else if (emailValidatorRegex.hasMatch(value) || value.isEmpty) {
          controller.removeSignInError(kInvalidEmailError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          controller.addSignInError(kEmailNullError);
          // print('empty email');
          return '';
        } else if (value.isNotEmpty && !emailValidatorRegex.hasMatch(value)) {
          controller.addSignInError(kInvalidEmailError);
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: controller.passwordController,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          controller.addSignInError(kPasswordNullError);
          return '';
        } else if (value.isNotEmpty && value.length < 8) {
          controller.addSignInError(kshortpasswordError);
          return '';
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeSignInError(kPasswordNullError);
        } else if (value.isEmpty || value.length >= 8) {
          controller.removeSignInError(kshortpasswordError);
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
}
