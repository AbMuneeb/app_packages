import 'package:fcm_push_settings/controllers/check_permission_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class CheckFcmPermissionRepoImpl extends CheckFcmPermissionRepo
{
  @override
  Future<bool> checkPermission(BuildContext context, FirebaseMessaging firebaseMessaging) async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized)
    {
      return true;
    }

    return false;
  }

}