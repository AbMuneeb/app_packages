import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:networking/networking.dart';
import 'package:networking/src/domain/repo/api_client.dart';

class ApiClientImpl extends ApiClient
{
  Dio? _dio;
  Function(DioException exception)? errorCallBack;

  @override
  void config({
    required Dio dio,
    required Future<String?> Function() refreshTokenImplementation,
    required RefreshTokenFormat? refreshTokenFormat,
  }) {
    _dio = dio;
    if(_dio != null)
    {
      _dio?.interceptors.add(GetRetryInternetInterceptor(dio: _dio!));
      _dio?.interceptors.add(GetRefreshTokenInterceptor(dio: _dio!,refreshTokenImplementation: refreshTokenImplementation,refreshTokenFormat: refreshTokenFormat));
    }
  }

  @override
  Future<Either<Response?,DioException>?> delete({required String url,Map<String, dynamic>? headers})async {
    try{
      /// Implement on demand
    }
    on DioException catch (e) {
      _errorHandler(e);
    }
    return null;
  }

  @override
  Future<Either<Response?,DioException>> get({required String url, Map<String, dynamic>? urlParameters,Options? headers})async {
    try{
      Response? response = await _dio?.get(url,queryParameters: urlParameters,options: headers);

      log('ResponseGet: ===------- Url: $url\n${jsonEncode(response?.data)}\n==---------\n\n');

      return Left(response);
    }
    on DioException catch (e) {
      log('ResponseGETError: ===------- Url: ${e.toString()}\n==---------\n\n');
      _errorHandler(e);
      return Right(e);
    }
  }

  @override
  Future<Either<Response?,DioException>> post({required String url, Map<String, dynamic>? bodyParameters,Map<String, dynamic>? urlParameters,Options? headers,Object? formData})async {
    try{
      Response? response = await _dio?.post(url,data: formData??bodyParameters,queryParameters: urlParameters,options: headers);

      log('ResponsePost: ===------- Url: $url\n${jsonEncode(response?.data)}\n==---------\n\n');

      return Left(response);
    }
    on DioException catch (e) {
      log('ResponsePOSTError: ===------- Url: ${e.toString()}\n==---------\n\n');
      _errorHandler(e);
      return Right(e);
    }
  }

  @override
  Future<Either<Response?,DioException>> put({required String url, Map<String, dynamic>? bodyParameters,Map<String, dynamic>? urlParameters,Options? headers,Object? formData})async {
    try{
      Response? response = await _dio?.put(url,data: formData??bodyParameters,queryParameters: urlParameters,options: headers);

      log('ResponsePost: ===------- Url: $url\n${jsonEncode(response?.data)}\n==---------\n\n');

      return Left(response);
    }
    on DioException catch (e) {
      _errorHandler(e);
      return Right(e);
    }
  }

  /// no need to expose this method
  _errorHandler(DioException dioException) {
    if(errorCallBack != null)
    {
      errorCallBack!(dioException);
    }
  }

  @override
  setGlobalErrorHandler({required Function(DioException exception) errorCallBack}) {
    this.errorCallBack = errorCallBack;
  }

  @override
  updateHeaders(Map<String, dynamic>? headers) {
    _dio?.options.headers = headers;
  }

  @override
  Dio? getDio() {
    return _dio;
  }

  @override
  addInterceptors(Iterable<Interceptor> interceptorsList) {
    _dio?.interceptors.addAll(interceptorsList);
  }


}