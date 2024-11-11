
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notifications/src/model/android_notification_settings.dart';


class AppNotificationSettings
{
  static FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;
  static AndroidNotificationDetails? _androidNotificationDetails;
  static late AndroidNotificationSettings _androidNotificationSettings;

  static Future initializeNotificationsSetting(
      {
        required Function(int id, String? title, String? body, String? payload) onDidReceiveLocalNotification,
        required Function(NotificationResponse? payload) onSelectNotification,
        required Function(NotificationResponse? payload) onSelectBackgroundNotification,
        required AndroidNotificationSettings androidNotificationSettingsIs
      }
      )
  async {
    _androidNotificationSettings = androidNotificationSettingsIs;

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,

    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      //    macOS: initializationSettingsMacOS
    );

    await _flutterLocalNotificationsPlugin?.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
      onDidReceiveBackgroundNotificationResponse: onSelectBackgroundNotification,
    );
  }

  static AndroidNotificationDetails _getAndroidNotificationDetails(AndroidNotificationSettings androidNotificationSettings)
  {
    final String groupKey = androidNotificationSettings.groupKey;
    final String groupChannelId = androidNotificationSettings.groupChannelId;
    final String groupChannelName = androidNotificationSettings.groupChannelName;

    _androidNotificationDetails ??= AndroidNotificationDetails(
        groupChannelId,
        groupChannelName,
        importance: Importance.max,
        priority: Priority.high,
        channelShowBadge: true,
        playSound: true,
        styleInformation: const BigTextStyleInformation(''),
        // sound: RawResourceAndroidNotificationSound(androidNotificationSettings.notificationRingingTone),
        groupKey: groupKey
    );

    return _androidNotificationDetails!;
  }
  /// this method will be used to show notification
  static Future showNotificationWithSound(String? title,String? body,dynamic payloadData) async {

    final AndroidNotificationDetails firstNotificationAndroidSpecifics = _getAndroidNotificationDetails(_androidNotificationSettings);
    //IOSNotificationDetails();
    final NotificationDetails firstNotificationPlatformSpecifics = NotificationDetails(
        android: firstNotificationAndroidSpecifics,

    );

    if(Platform.isAndroid)
    {
      //print('notificajsad $title');
      await _flutterLocalNotificationsPlugin?.show(
          1,
          title,
          body,
          firstNotificationPlatformSpecifics,
          payload: '${payloadData['payload']}'
      );
    }
    else{
      await _flutterLocalNotificationsPlugin?.show(
          0,
          title,
          body,
          firstNotificationPlatformSpecifics,
          payload: '${payloadData['payload']}'
      );
    }
  }

  static FlutterLocalNotificationsPlugin? getFlutterLocalNotificationsPlugin()
  {
    return _flutterLocalNotificationsPlugin;
  }


}
