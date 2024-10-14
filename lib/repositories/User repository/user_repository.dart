import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/database/api/api_consumer.dart';
import 'package:e_commerce/core/database/api/end_points.dart';
import 'package:e_commerce/core/database/cache/cache_helper.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/models/sign_in_model.dart';
import 'package:e_commerce/models/sign_up_model.dart';
import 'package:e_commerce/models/verification_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  final ApiConsumer api = Get.find();
  final cache = Get.find<CacheHelperService>();

  //!sign up and handling:
  Future<Either<String, SignUpModel>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmedPassword,
    required String address,
  }) async {
    try {
      final Map<String, dynamic> response = await api.post(EndPoints.signUp, data: {
        ApiKeys.firstName: firstName,
        ApiKeys.lastName: lastName,
        ApiKeys.email: email,
        ApiKeys.mobile: phoneNumber,
        ApiKeys.password: password,
        ApiKeys.passwordConfirmation: confirmedPassword,
        ApiKeys.address: address,
      });
      final signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errMessage);
    } on SocketException {
      return const Left('Unknown error');
    }
  }

  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> response = await api.post(EndPoints.signIn, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
      });

      final signInModel = SignInModel.fromJson(response);
      final token = signInModel.token;
      cache.saveData(key: CacheKeys.token, value: token);
      cache.saveData(key: CacheKeys.user, value: jsonEncode(response));


      return Right(signInModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errMessage);
    } on SocketException {
      return const Left('Unknown error');
    }
  }

  Future<Either<String, VerificationModel>> verifyEmail({
    required String email,
    required String verificationCode,
  }) async {
    try {
      final response = await api.post(EndPoints.verifyEmail, data: {
        ApiKeys.email: email,
        ApiKeys.verificationCode: verificationCode,
      });
      final VerificationModel verificationModel = VerificationModel.fromJson(response);
      return Right(verificationModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errMessage);
    }
  }
}
