import 'package:e_commerce/core/database/api/end_points.dart';

class ErrorModel {
  final int? statusCode;
  final String errMessage;

  ErrorModel({required this.statusCode, required this.errMessage});

  factory ErrorModel.fromException(Map<String, dynamic> errorData) {
    String errMessages;
    if (errorData[ApiKeys.message] == null) {
      errMessages = 'Connection Timeout';
    } else {
      errMessages = errorData[ApiKeys.message];
    }
    return ErrorModel(
      statusCode: errorData[ApiKeys.statusCode],
      errMessage: errMessages,
    );
  }
}
