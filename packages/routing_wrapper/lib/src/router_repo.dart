

import 'package:flutter/material.dart';
import 'package:routing_wrapper/routing_wrapper.dart';

abstract class NavigatorService
{
  static final NavigatorService _instance = NavigatorServiceImpl();
  static NavigatorService get instance => _instance;
  

  Future<T?> pushNamed<T>(
      BuildContext context,
      {
        required String pageName,
        Map<String, String>? arguments,
        SuccessCallback<T>? successCallback,
        ErrorHandler? errorHandler,
      });

  Future<T?> pushReplacementNamed<T>(
      BuildContext context,
      {
        required String pageName,
        Map<String, String>? arguments,
        SuccessCallback<T>? successCallback,
        ErrorHandler? errorHandler,
      });

  Future<T?> popAndPushNamed<T>(
      BuildContext context,
      {
        required String pageName,
        Map<String, String>? arguments,
        SuccessCallback<T>? successCallback,
        ErrorHandler? errorHandler,
      });

  Future<T?> pushNamedAndRemoveUntil<T>(
      BuildContext context,
      {
        required String pageName,
        Map<String, String>? arguments,
        SuccessCallback<T>? successCallback,
        ErrorHandler? errorHandler,
      });

  void popUntil(
      BuildContext context,
      {
        required String pageName,
        required String targetRoute,
        SuccessCallback<bool>? successCallback,
        ErrorHandler? errorHandler,
      });

  void pop(
      BuildContext context,
      {
        Map<String, dynamic>? arguments,
        SuccessCallback<bool>? successCallback,
        ErrorHandler? errorHandler,
      });
}

/// Typedefs for cleaner function signatures and handling different success types.
typedef SuccessCallback<T> = void Function(T value);
typedef ErrorHandler = void Function(dynamic error, StackTrace stackTrace);
