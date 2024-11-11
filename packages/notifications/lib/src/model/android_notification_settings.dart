import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'android_notification_settings.freezed.dart';
part 'android_notification_settings.g.dart';

@freezed
class AndroidNotificationSettings with _$AndroidNotificationSettings
{
  const factory AndroidNotificationSettings({
    required String groupKey,
    required String groupChannelId,
    required String groupChannelName,
    required String notificationRingingTone
  }) = _AndroidNotificationSettingsData;

  factory AndroidNotificationSettings.fromJson(Map<String, Object?> json)
  => _$AndroidNotificationSettingsFromJson(json);
}