import 'package:e_commerce/core/database/api/end_points.dart';

class SignUpModel {
  final String message;
  final bool successful;
  final int statusCode;

  SignUpModel({required this.message, required this.successful, required this.statusCode});
    factory SignUpModel.fromJson(dynamic jsonData){
      return SignUpModel(
        message: jsonData[ApiKeys.message],
        successful: jsonData[ApiKeys.successful],
        statusCode: jsonData[ApiKeys.statusCode],
      );
    }
}
