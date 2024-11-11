import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class DioConnectivityRequestRetry {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetry({
    required this.dio,
    required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen(
          (connectivityResult) async {
        // We're connected either to WiFi or mobile data
        if (connectivityResult.contains(ConnectivityResult.none) == false) {
          // Ensure that only one retry happens per connectivity change by cancelling the listener
          streamSubscription.cancel();
          // Copy & paste the failed request's data into the new request
          responseCompleter.complete(
              dio.request(
                requestOptions.path,
                data: requestOptions.data,
                queryParameters: requestOptions.queryParameters,
                cancelToken: requestOptions.cancelToken,
                options: Options(
                    method: requestOptions.method,
                    sendTimeout: requestOptions.sendTimeout,
                    receiveTimeout: requestOptions.receiveTimeout,
                    extra: requestOptions.extra,
                    headers: requestOptions.headers,
                    preserveHeaderCase: requestOptions.preserveHeaderCase,
                    responseType: requestOptions.responseType,
                    contentType: requestOptions.contentType,
                    validateStatus: requestOptions.validateStatus,
                    receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
                    followRedirects: requestOptions.followRedirects,
                    maxRedirects: requestOptions.maxRedirects,
                    persistentConnection: requestOptions.persistentConnection,
                    requestEncoder: requestOptions.requestEncoder,
                    responseDecoder: requestOptions.responseDecoder,
                    listFormat: requestOptions.listFormat
                ),
                onSendProgress: requestOptions.onSendProgress,
                onReceiveProgress: requestOptions.onReceiveProgress,
              )
          );
        }
      },
    );
    return responseCompleter.future;
  }
}