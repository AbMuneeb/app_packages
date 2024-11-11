import 'package:dio/dio.dart';

class ApiConstantValues
{
  static const contentType = 'application/json';
  static const acceptHeader = 'application/json';
  static const milliSecondsReceiveTimeOut = 5000;
  static const milliSendReceiveTimeOut = 5000;

  static const NOT_AUTHORIZED = 401;


  static const headersDefault = {
    Headers.acceptHeader: acceptHeader,
    "Content-Type": contentType,
  };

}