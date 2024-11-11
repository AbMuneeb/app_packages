import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:networking/src/data/repoImpl/apiClientRepoImpl.dart';
import 'package:networking/src/domain/model/refresh_token_format.dart';

abstract class ApiClient
{
  static final ApiClient _instance = ApiClientImpl();
  static ApiClient get instance => _instance;

  void config({required Dio dio, required Future<String?> Function() refreshTokenImplementation, required RefreshTokenFormat? refreshTokenFormat});
  Future<Either<Response?,DioException>> post({required String url, Map<String, dynamic>? bodyParameters,Map<String, dynamic>? urlParameters,Options? headers,Object? formData});
  Future<Either<Response?,DioException>> put({required String url, Map<String, dynamic>? bodyParameters,Map<String, dynamic>? urlParameters,Options? headers,Object? formData});
  Future<Either<Response?,DioException>> get({required String url,Map<String, dynamic>? urlParameters,Options? headers});
  Future<Either<Response?,DioException>?>? delete({required String url,Map<String, dynamic>? headers});
  setGlobalErrorHandler({required Function(DioException exception) errorCallBack,});
  updateHeaders(Map<String, dynamic>? headers);
  addInterceptors(Iterable<Interceptor> interceptorsList);
  Dio? getDio();
}