import 'package:e_commerce/core/database/api/end_points.dart';

class ErrorModel {
  final int? status;
  final String errMessage;

  ErrorModel({required this.status, required this.errMessage});

  factory ErrorModel.fromException(Map<String,dynamic> errorData) {
    return ErrorModel(
      status: errorData[ApiKeys.status],
      errMessage: errorData[ApiKeys.data][ApiKeys.email],
    );
  }
}
