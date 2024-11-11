import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:networking/src/domain/repo/interceptors_repo.dart';
import 'package:networking/src/utils/retry_internet_checker.dart';

class GetRetryInternetInterceptor extends InterceptorsRepo
{
  Dio dio;
  GetRetryInternetInterceptor({required this.dio});

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {

    if (_shouldRetry(err)) {
      try {

        Response response = await DioConnectivityRequestRetry(dio: dio, connectivity: Connectivity()).scheduleRequestRetry(err.requestOptions);
        return handler.resolve(response);
      } on DioException catch (e) {
        // Let any new error from the retrier pass through
        return handler.next(e);
      }
    }
    // Let the error "pass through" if it's not the error we're looking for
    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    if (err.type == DioExceptionType.connectionError && err.error is SocketException) {
      SocketException socketException = err.error as SocketException;
      // Retry only if it's not a DNS lookup failure (ENOTFOUND)
      if (socketException.osError?.errorCode != 11001 && // Windows ENOTFOUND code
          socketException.osError?.errorCode != 8) { // Unix/Linux ENOTFOUND code
        return true;
      }
    }
    return false;
  }
}