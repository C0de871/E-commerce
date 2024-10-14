// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/database/api/end_points.dart';

import 'Sign In submodel/user.dart';

class SignInModel {
  bool successful;
  String message;
  String token;
  String tokenType;
  User user;
  int statusCode;
  SignInModel({
    required this.successful,
    required this.message,
    required this.token,
    required this.tokenType,
    required this.user,
    required this.statusCode,
  });

  factory SignInModel.fromJson(Map<String, dynamic> data) {
    return SignInModel(
      successful: data[ApiKeys.successful],
      message: data[ApiKeys.message],
      token: data[ApiKeys.data][ApiKeys.token],
      tokenType: data[ApiKeys.data][ApiKeys.tokenType],
      user: User.fronJson(data[ApiKeys.data][ApiKeys.user]),
      statusCode: data[ApiKeys.statusCode],
    );
  }
}
