
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:networking/src/domain/model/refresh_token_format.dart';
import 'package:networking/src/domain/repo/api_client.dart';


class ApiController
{
  static final ApiController _instance = ApiController();
  static ApiController get instance => _instance;

  config({
    required Dio dio,
    required Future<String?> Function() refreshTokenImplementation,
    required RefreshTokenFormat? refreshTokenFormat
  }) {
    ApiClient.instance.config(dio: dio,refreshTokenImplementation: refreshTokenImplementation,refreshTokenFormat: refreshTokenFormat);
  }

  addInterceptors(Iterable<Interceptor> interceptorsList) {
    ApiClient.instance.addInterceptors(interceptorsList);
  }

  Future<Either<Response?, DioException>?> delete({required String url, Map<String, dynamic>? headers}) async {
    return await ApiClient.instance.delete(url: url,headers: headers);
  }

  Future<Either<Response?, DioException>> get({required String url, Map<String, dynamic>? urlParameters, Options? headers}) async {
    return await ApiClient.instance.get(url: url,urlParameters: urlParameters,headers: headers);
  }

  Dio? getDio() {
    return ApiClient.instance.getDio();
  }

  Future<Either<Response?, DioException>> post({required String url, Map<String, dynamic>? bodyParameters, Map<String, dynamic>? urlParameters,Options? headers,Object? formData}) async {
    return await ApiClient.instance.post(url: url,bodyParameters: bodyParameters,urlParameters: urlParameters,headers: headers,formData: formData);
  }

  Future<Either<Response?, DioException>> put({required String url, Map<String, dynamic>? bodyParameters, Map<String, dynamic>? urlParameters,Options? headers,Object? formData}) async {
    return await ApiClient.instance.put(url: url,bodyParameters: bodyParameters,urlParameters: urlParameters,headers: headers,formData: formData);
  }

  setGlobalErrorHandler({required Function(DioException exception) errorCallBack}) {
    ApiClient.instance.setGlobalErrorHandler(errorCallBack: errorCallBack);
  }

  updateHeaders(Map<String, dynamic>? headers) {
    ApiClient.instance.updateHeaders(headers);
  }

}