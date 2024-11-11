
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_wrapper/routing_wrapper.dart';

class NavigatorServiceImpl extends NavigatorService
{
  NavigatorServiceImpl();


  /// This method with just pushed the page to desired route name
  @override
  Future<T?> pushNamed<T>(
      BuildContext context,
      {
        required String pageName,
        Map<String, String>? arguments,
        SuccessCallback<T>? successCallback,
        ErrorHandler? errorHandler,
      }) async {
    try {
      Object? result;

      if(arguments != null)
      {
        result = await GoRouter.of(context).pushNamed(
          pageName,
          pathParameters: arguments,
        );
      }
      else
      {
        result = await GoRouter.of(context).pushNamed(
          pageName,
        );
      }

      if (successCallback != null) {
        successCallback(result as T); // Type-safe casting
      }
      return result as T?;
    } catch (error, stackTrace) {
      if (errorHandler != null) {
        errorHandler(error, stackTrace);
      }
      else {
        rethrow; // Rethrow to propagate the error if not handled
      }
    }

    return null;

  }

  /// Use popAndPushNamed when you want to navigate to a new screen while maintaining
  /// the ability for the user to navigate back to the previous screen. The exit animation
  /// provides a clear indication of the change.
  @override
  Future<T?> popAndPushNamed<T>(BuildContext context, {required String pageName, Map<String, String>? arguments, SuccessCallback<T>? successCallback, ErrorHandler? errorHandler}) async {
    try{
      if(GoRouter.of(context).canPop())
        {
          GoRouter.of(context).pop();
        }
      return await pushNamed(context, pageName: pageName,arguments: arguments, successCallback: successCallback,errorHandler: errorHandler);
    } catch (error, stackTrace) {
      if (errorHandler != null) {
        errorHandler(error, stackTrace);
      }
      else {
        rethrow; // Rethrow to propagate the error if not handled
      }
    }
    return null;
  }

  /// Use pushReplacementNamed when you want to create the feeling of a new top-level screen
  /// that the user cannot navigate back from immediately, like a login screen. The enter
  /// animation focuses on introducing the new screen.
  @override
  Future<T?> pushReplacementNamed<T>(BuildContext context, {required String pageName, Map<String, String>? arguments, SuccessCallback<T>? successCallback, ErrorHandler? errorHandler}) async {
    try{
      Object? result;

      if(arguments != null)
      {
        result = await GoRouter.of(context).pushReplacementNamed(
          pageName,
          pathParameters: arguments,
        );
      }
      else
      {
        result = await GoRouter.of(context).pushReplacementNamed(
          pageName,
        );
      }

      if (successCallback != null) {
        successCallback(result as T); // Type-safe casting
      }
      return result as T?;
    } catch (error, stackTrace) {
      if (errorHandler != null) {
        errorHandler(error, stackTrace);
      }
      else {
        rethrow; // Rethrow to propagate the error if not handled
      }
    }
    return null;
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T>(BuildContext context, {required String pageName, Map<String, String>? arguments, SuccessCallback<T>? successCallback, ErrorHandler? errorHandler}) async {
    try{
      // while (GoRouter.of(context).canPop()) {
      //   context.pop();
      // }
     // GoRouter.of(context).routerDelegate.currentConfiguration.routes;
      if(arguments != null)
        {
          GoRouter.of(context).goNamed(pageName,pathParameters: arguments);
        }
      else
        {
          GoRouter.of(context).goNamed(pageName);
        }
      //await pushReplacementNamed(context, pageName: pageName,arguments: arguments, successCallback: successCallback,errorHandler: errorHandler);

    }
    catch (error, stackTrace) {
      if (errorHandler != null) {
        errorHandler(error, stackTrace);
      }
      else {
        rethrow; // Rethrow to propagate the error if not handled
      }
    }
    return null;
  }

  @override
  void popUntil(BuildContext context, {required String pageName, String? targetRoute, SuccessCallback<bool>? successCallback, ErrorHandler? errorHandler}) {

    try {
      while ((GoRouter.of(context).canPop())&&(ModalRoute.of(context)!.settings.name != targetRoute)) {
        GoRouter.of(context).pop();
      }


      if (successCallback != null) {
        successCallback(true); // Type-safe casting
      }

    } catch (error, stackTrace) {
      if (errorHandler != null) {
        errorHandler(error, stackTrace);
      }
      else {
        rethrow; // Rethrow to propagate the error if not handled
      }
    }
  }

  @override
  void pop(BuildContext context, {Map<String, dynamic>? arguments, SuccessCallback<bool>? successCallback, ErrorHandler? errorHandler}) {
    try {

      GoRouter.of(context).pop(arguments);

      if (successCallback != null) {
        successCallback(true); // Type-safe casting
      }

    } catch (error, stackTrace) {
      if (errorHandler != null) {
        errorHandler(error, stackTrace);
      }
      else {
        rethrow; // Rethrow to propagate the error if not handled
      }
    }
  }


}

