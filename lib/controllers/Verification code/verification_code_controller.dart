import 'dart:developer';

import 'package:e_commerce/repositories/User%20repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  final UserRepository userRepository = Get.find();

  //!verfication code TextEditingController:
  TextEditingController codeController = TextEditingController();
  final String email = Get.arguments;

  Rx<VerfiyCodeLoadingState> verfiyCodeLoadingState = VerfiyCodeLoadingState.idle.obs;

  //! Verify code method:
  verifyCode() async {
    verfiyCodeLoadingState.value = VerfiyCodeLoadingState.loading;
    log(email);
    log(codeController.text);
    final response = await userRepository.verifyEmail(
      email: email,
      verificationCode: codeController.text,
    );

    response.fold(
      (errMessege) {
        verfiyCodeLoadingState.value = VerfiyCodeLoadingState.hasError;
        Get.snackbar('Error!', errMessege);
      },
      (verificationModel) {
        verfiyCodeLoadingState.value = VerfiyCodeLoadingState.doneWithData;
        Get.snackbar('Success', verificationModel.message);
        //todo: navigate to home screen after successful verification
      },
    );
  }
}

//! verifyCode States:
enum VerfiyCodeLoadingState {
  idle,
  loading,
  doneWithData,
  doneWithNoData,
  hasError,
}
