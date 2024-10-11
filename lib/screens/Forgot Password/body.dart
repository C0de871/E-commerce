import 'package:e_commerce/core/Custom%20Widget/custom_suffix_icon.dart';
import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/Custom%20Widget/form_error.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/screens/SignIn/components/no_account_text.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.relativeWidth(20, context),
        ),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: SizeConfig.relativeWidth(20, context),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Please enter your email and we will send\nyou a password reset link.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            const ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  List<String> errors = [];
  String? email;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
              if ((value == null || value.isEmpty) && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (value!.isNotEmpty && !emailValidatorRegex.hasMatch(value) && !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              labelText: 'Email',
              suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Mail.svg'),
            ),
          ),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight! * 0.1),
          DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              }),
          SizedBox(height: SizeConfig.screenHeight! * 0.1),
          const NoAccountText(),
        ],
      ),
    );
  }
}
