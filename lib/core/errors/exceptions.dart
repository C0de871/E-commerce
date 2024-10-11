import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    //didn't reach database :
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));

    //reach database and database send a error message:
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // bad request
          throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
        case 401: // unauthorized
          throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
        case 403: // forbidden
          throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
        case 404: // not found
          throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
        case 409: // confficient
          throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
        case 422: // unprocessable entity
          throw ServerException(errorModel: ErrorModel.fromException(e.response!.data));
        case 504: // server exception
      }
  }
}
