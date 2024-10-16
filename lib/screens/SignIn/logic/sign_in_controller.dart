import 'package:e_commerce/repositories/User%20repository/user_repository.dart';
import 'package:e_commerce/screens/Login%20Success/login_success_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final UserRepository userRepository = Get.find();
  RxBool isRemebered = false.obs;
  final RxList<String> errors = <String>[].obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void changeRemeberedState(bool? value) {
    isRemebered.value = value!;
  }

  void addSignInError(String error) {
    if (!errors.contains(error)) {
      errors.add(error);
    }
  }

  void removeSignInError(String error) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }

  Rx<SignInLoadingState> signInAccountLoadingState = SignInLoadingState.idle.obs;

  //! Sign Up Method:
  signIn() async {
    //! calling the signUp method from the UserRepository:
    signInAccountLoadingState.value = SignInLoadingState.loading;
    final response = await userRepository.signIn(
      email: emailController.text,
      password: passwordController.text,
    );

    //! choose the right state to emit:
    response.fold(
      (errMassege) {
        signInAccountLoadingState.value = SignInLoadingState.hasError;
        Get.snackbar('Error!', errMassege);
      },
      (signInModel) {
        signInAccountLoadingState.value = SignInLoadingState.doneWithData;
        Get.snackbar('Success', signInModel.message);
        Get.offAllNamed(LoginSuccessScreen.routeName);
      },
    );
  }

  //Sign In:
}

//! signUp States:
enum SignInLoadingState {
  idle,
  loading,
  doneWithData,
  doneWithNoData,
  hasError,
}
