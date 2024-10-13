// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/database/api/end_points.dart';

class VerificationModel {
  bool successful;
  int statusCode;
  String message;
  VerificationModel({
    required this.successful,
    required this.statusCode,
    required this.message,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> data) {
    return VerificationModel(
      successful: data[ApiKeys.successful],
      statusCode: data[ApiKeys.statusCode],
      message: data[ApiKeys.message],
    );
  }
}
