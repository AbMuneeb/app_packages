import 'package:fcm_push_settings/services/check_permission_repo_impl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

abstract class CheckFcmPermissionRepo
{
  static final CheckFcmPermissionRepo _instance = CheckFcmPermissionRepoImpl();
  static CheckFcmPermissionRepo get instance => _instance;

  Future<bool> checkPermission(BuildContext context,FirebaseMessaging firebaseMessaging);
}