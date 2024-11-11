import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:networking/src/domain/model/const_values.dart';
import 'package:networking/src/domain/model/refresh_token_format.dart';
import 'package:networking/src/domain/repo/interceptors_repo.dart';

class GetRefreshTokenInterceptor extends InterceptorsRepo
{
  Dio dio;
  RefreshTokenFormat? refreshTokenFormat;
  Future<String?> Function() refreshTokenImplementation;
  GetRefreshTokenInterceptor({required this.dio,required this.refreshTokenImplementation,this.refreshTokenFormat});

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    RefreshTokenFormat refreshTokenFormat = this.refreshTokenFormat ?? RefreshTokenFormat();
    if (err.response?.statusCode == ApiConstantValues.NOT_AUTHORIZED) {
      // If a 401 response is received, refresh the access token
      String? newAccessToken = await refreshTokenImplementation();

      if(newAccessToken != null)
        {
          String newToken = refreshTokenFormat.isBearer?'Bearer $newAccessToken':newAccessToken;
          // Update the request header with the new access token
          err.requestOptions.headers[refreshTokenFormat.headerName] = newToken;

          try {
            // Attempt to retry the request with the updated header
            log('Retrying with new token ${err.requestOptions.headers}');

            Dio dioWithoutInterceptor = Dio(BaseOptions(
              baseUrl: dio.options.baseUrl,
              headers: dio.options.headers,
              connectTimeout: dio.options.connectTimeout,
              receiveTimeout: dio.options.receiveTimeout,
              contentType: dio.options.contentType,
              responseType: dio.options.responseType,
            ));

            // Copy options like headers, base URL, etc.
            dioWithoutInterceptor.options = dio.options;

            // Clear all interceptors for this cloned instance
            dioWithoutInterceptor.interceptors.clear();

            final response = await dioWithoutInterceptor.fetch(err.requestOptions).timeout(Duration(seconds: 10));
            return handler.resolve(response);
          } on DioException catch (e) {
            // If the request fails again, pass the error to the next interceptor or return it
            log('Retrying failed ${e.toString()}');
            return handler.next(err);
          } catch(e){
            log('Retrying failed ${e.toString()}');
            return handler.next(err);
          }
        }
    }
    return handler.next(err);
  }
}