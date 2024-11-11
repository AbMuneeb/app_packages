import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:networking/networking.dart';
import 'package:networking/src/data/repoImpl/apiClientRepoImpl.dart';
import 'package:networking/src/domain/model/refresh_token_format.dart';
import 'package:networking/src/domain/repo/api_client.dart';


// @GenerateNiceMocks([MockSpec<Dio>(), MockSpec<ApiController>(), MockSpec<ApiClient>(), MockSpec<ApiClientImpl>(), MockSpec<GetRetryInternetInterceptor>()])
void main() {
  // MockDio mockDio = MockDio();
  //
  // setUp((){
  //   mockDio.options = BaseOptions(
  //       baseUrl: 'http://numbersapi.com'
  //   );
  //   when(mockDio.interceptors).thenReturn(Interceptors());
  //
  //   ApiController.instance.config(
  //       dio: mockDio,
  //       refreshTokenImplementation: () async{
  //         return '123';
  //         },
  //       refreshTokenFormat: RefreshTokenFormat()
  //   );
  //
  //   // when(ApiController.instance.get(url: '/random/trivia?json')).thenReturn(Right(Response(
  //   //   requestOptions: RequestOptions(path: ''),
  //   //   data: 'Mocked data',
  //   //   statusCode: 200,
  //   // )));
  // });
  // test('adds one to input values', () async {
  //   Either<Response?, DioException> response = await ApiController.instance.get(url: '/random/trivia?json');
  //   if(response.isLeft)
  //     {
  //       expect(response.left?.statusCode, 200);
  //     }
  // });
}
