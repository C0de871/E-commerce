import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/database/api/api_consumer.dart';
import 'package:e_commerce/core/database/api/end_points.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/models/sign_up_model.dart';
import 'package:get/get.dart';


class UserRepository extends GetxService{
  final ApiConsumer api = Get.find();

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
      final response = await api.post(EndPoints.signUp, data: {
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
    }
  }
}
