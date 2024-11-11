import 'dart:developer';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../controllers/check_permission_repo.dart';

class FirebaseSetup
{
  static late FirebaseMessaging _firebaseMessaging;
  static late Future<void> Function(RemoteMessage message) _firebaseMessagingBackgroundHandler;

  static Future init(
      BuildContext context,
      {
        required Function(bool) notificationPermissionStatusUpload,
        required Function(String) uploadTokenToAny,
        required Function(dynamic) errorHandler,
        required Function(Map<dynamic, dynamic>? message, RemoteNotification? notification) showNotification,
        required Future<void> Function(RemoteMessage message) firebaseMessagingBackgroundHandler,
        required Function(RemoteMessage message) onMessageOpenedApp,
      })
  async {
    _firebaseMessagingBackgroundHandler = firebaseMessagingBackgroundHandler;
    _firebaseMessaging = createFirebaseMessagingInstance();

    bool permission = await firebaseCheckPermission(context, firebaseMessaging: _firebaseMessaging);
    notificationPermissionStatusUpload(permission);

    if (permission == true) {

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        onMessageOpenedApp(message);
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        try{
          log("firebasemessageee ${message.data}");
          showNotification(message.data,message.notification);

        }catch(e){
          errorHandler(e);
        }
      });

      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandlerIs);

      Either<String,Object> isTokenFound = await generateToken(_firebaseMessaging);

      if(isTokenFound.isLeft)
      {
        uploadTokenToAny(isTokenFound.left);
      }
      else
      {
        errorHandler(isTokenFound.right);
      }
    }

  }

  static FirebaseMessaging createFirebaseMessagingInstance()
  {
    return FirebaseMessaging.instance;
  }

  static Future<bool> firebaseCheckPermission(BuildContext context, {FirebaseMessaging? firebaseMessaging})
  async {
    return await CheckFcmPermissionRepo.instance.checkPermission(context, firebaseMessaging??FirebaseMessaging.instance);
  }

  static Future<Either<String, Object>> generateToken(FirebaseMessaging firebaseMessaging)
  async {

    try{
      String? token;
      if (Platform.isIOS) {
        String? apnsToken = await firebaseMessaging.getAPNSToken();
        if (apnsToken != null) {
          token = await firebaseMessaging.getToken();
        } else {
          await Future<void>.delayed(
            const Duration(
              seconds: 3,
            ),
          );
          apnsToken = await firebaseMessaging.getAPNSToken();
          if (apnsToken != null) {
            token = await firebaseMessaging.getToken();
          }
        }
      } else {
        token = await firebaseMessaging.getToken();
      }

      if(token != null)
        {
          return Left(token);
        }
      return Right(throw Exception('Token not retrieved from Firebase Messaging'));
    }catch (e)
    {
      return Right(e);
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandlerIs(RemoteMessage message) async {
    _firebaseMessagingBackgroundHandler(message);
  }

// static showNotification(Map<dynamic, dynamic>? message, RemoteNotification? notification)async
// {
//   showNotificationWithSound(notification?.title,notification?.body,message);
//   FcmPayloadDealerRepo.instance.dealWithRealNotifications(message);
// }
}

