import 'package:e_commerce/core/Custom%20Widget/custom_suffix_icon.dart';
import 'package:e_commerce/core/Custom%20Widget/default_button.dart';
import 'package:e_commerce/core/Custom%20Widget/form_error.dart';
import 'package:e_commerce/core/configurations/constants.dart';
import 'package:e_commerce/controllers/Sign_up_controller/sign_up_controller.dart';
import 'package:e_commerce/core/configurations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  String? firstName, lastName, phoneNumber, address;

  SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.completeProfileformKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          buildSecondNameFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          buildPhoneNumberFormField(),
          SizedBox(height: SizeConfig.relativeHeight(30, context)),
          buildAddressFormField(),
          Obx(() => FormError(errors: controller.completeProfileErrors.toList())),
          SizedBox(height: SizeConfig.relativeHeight(40, context)),
          Obx(
            () => controller.signInAccountLoadingState.value == SignUpLoadingState.loading
                ? const CircularProgressIndicator()
                : DefaultButton(
                    text: 'Sign Up',
                    press: () async {
                      if (controller.completeProfileformKey.currentState!.validate()) {
                        controller.completeProfileformKey.currentState!.save();
                        await controller.signUp();
                      }
                    },
                  ),
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: controller.signUpAddress,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeCompleteProfileError(error: kAddressNullError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          controller.addCompleteProfileError(error: kAddressNullError);
          // print('empty email');
          return '';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Address',
        hintText: 'Enter your Address',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Location point.svg'),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: controller.signUpPhoneNumber,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeCompleteProfileError(error: kPhoneNumberNullError);
        }
        return;
      },
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          controller.addCompleteProfileError(error: kPhoneNumberNullError);
          // print('empty email');
          return '';
        }
        if (value.length < 10) {
          controller.addCompleteProfileError(error: kPhoneNumberLessThan10Error);
          return '';
        }
        return null;
      },
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your Phone Number',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField buildSecondNameFormField() {
    return TextFormField(
      controller: controller.signUpLastName,
      onSaved: (newValue) => lastName = newValue,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your Last Name',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: controller.signUpFirstName,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeCompleteProfileError(error: kfirstNameNullError);
        }
      },
      validator: (value) {
        if ((value == null || value.isEmpty)) {
          controller.addCompleteProfileError(error: kfirstNameNullError);
          // print('empty email');
          return '';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your First Name',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/User.svg'),
      ),
    );
  }
}
