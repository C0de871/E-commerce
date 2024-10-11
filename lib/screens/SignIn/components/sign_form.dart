import 'package:e_commerce/core/Custom%20Widget/custom_suffix_icon.dart';
import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/Custom%20Widget/form_error.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/screens/Forgot%20Password/forgot_password_screen.dart';
import 'package:e_commerce/screens/Login%20Success/login_success_screen.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? email, password;
  bool isRemebered = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          buildPasswordFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          Row(
            children: [
              Checkbox(
                value: isRemebered,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    isRemebered = value!;
                  });
                },
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
          FormError(errors: errors),
          SizedBox(height: SizeConfig.relativeHeight(20, context)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.of(context).pushNamedAndRemoveUntil(LoginSuccessScreen.routeName, (Route<dynamic> route) => false);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (((emailValidatorRegex.hasMatch(value) || value.isEmpty) && errors.contains(kInvalidEmailError))) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          if (!errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kEmailNullError);
            });
          }
          // print('empty email');
          return '';
        } else if (value.isNotEmpty && !emailValidatorRegex.hasMatch(value)) {
          if (!errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
          }
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
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          if (!errors.contains(kPasswordNullError)) {
            setState(() {
              errors.add(kPasswordNullError);
            });
          }
          return '';
        } else if (value.isNotEmpty && value.length < 8) {
          if (!errors.contains(kshortpasswordError)) {
            setState(() {
              errors.add(kshortpasswordError);
            });
          }
          return '';
        }
        return null;
      },
      onChanged: (value) {
        if ((value.isNotEmpty) && errors.contains(kPasswordNullError)) {
          setState(() {
            errors.remove(kPasswordNullError);
          });
        } else if ((value.isEmpty || value.length >= 8) && errors.contains(kshortpasswordError)) {
          setState(() {
            errors.remove(kshortpasswordError);
          });
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
