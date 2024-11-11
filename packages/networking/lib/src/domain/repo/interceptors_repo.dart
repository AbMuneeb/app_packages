
import 'package:dio/dio.dart';

abstract class InterceptorsRepo<T> extends QueuedInterceptorsWrapper
{
  /// Each class that wants to implement interceptor will extend this class
}

