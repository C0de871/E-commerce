import 'package:e_commerce/repositories/User%20repository/user_repository.dart';
import 'package:e_commerce/screens/OTP/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final UserRepository userRepository = Get.find();
  //! Sign Up Screen TextEditingControllers:
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmedPassword = TextEditingController();

  //! Sign Up Screen fields:
  RxList<String> signUpErrors = <String>[].obs;
  final signUpformKey = GlobalKey<FormState>();

  //! Sign Up Screen Methods:
  void addSignUpError({required String error}) {
    if (!signUpErrors.contains(error)) {
      signUpErrors.add(error);
    }
  }
  void removeSignUpError({required String error}) {
    if (signUpErrors.contains(error)) {
      signUpErrors.remove(error);
    }
  }

  //! Complete profile Screen TextEditingControllers:
  TextEditingController signUpFirstName = TextEditingController();
  TextEditingController signUpLastName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpAddress = TextEditingController();

  //! Complete Profile Screen fields:
  RxList<String> completeProfileErrors = <String>[].obs;
  final completeProfileformKey = GlobalKey<FormState>();

  //! Complete Profile Screen Methods:
  void addCompleteProfileError({required String error}) {
    if (!completeProfileErrors.contains(error)) {
      completeProfileErrors.add(error);
    }
  }
  void removeCompleteProfileError({required String error}) {
    if (completeProfileErrors.contains(error)) {
      completeProfileErrors.remove(error);
    }
  }

  Rx<SignUpLoadingState> signInAccountLoadingState = SignUpLoadingState.idle.obs;

  //! Sign Up Method:
  signUp() async {

    //! calling the signUp method from the UserRepository:
    signInAccountLoadingState.value = SignUpLoadingState.loading;
    final response = await userRepository.signUp(
      firstName: signUpFirstName.text,
      lastName: signUpLastName.text,
      email: signUpEmail.text,
      phoneNumber: signUpPhoneNumber.text,
      password: signUpPassword.text,
      confirmedPassword: signUpConfirmedPassword.text,
      address: signUpAddress.text,
    );

    //! choose the right state to emit:
    response.fold(
      (errMassege) {
        signInAccountLoadingState.value = SignUpLoadingState.hasError;
        Get.snackbar('Error!', errMassege);
      },
      (signUpModel) {
        signInAccountLoadingState.value = SignUpLoadingState.doneWithData;
        Get.snackbar('Success', signUpModel.message);
        Get.toNamed(OtpScreen.routeName, arguments: signUpEmail.text);
      },
    );
  }

  //Sign In:
}

//! signUp States:
enum SignUpLoadingState {
  idle,
  loading,
  doneWithData,
  doneWithNoData,
  hasError,
}
