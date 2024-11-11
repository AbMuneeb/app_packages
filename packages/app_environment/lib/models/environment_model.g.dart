// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvironmentModelImpl _$$EnvironmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EnvironmentModelImpl(
      appTitle: json['appTitle'] as String,
      groupKey: json['groupKey'] as String?,
      groupChannelId: json['groupChannelId'] as String?,
      groupChannelName: json['groupChannelName'] as String?,
      appNameId: json['appNameId'] as String?,
      environment: json['environment'] as String,
      baseUrl: json['baseUrl'] as String,
      iconLogo: json['iconLogo'] as String,
      iconSvg: json['iconSvg'] as String,
      applicationAndroidStoreId: json['applicationAndroidStoreId'] as String?,
      applicationIOSStoreId: json['applicationIOSStoreId'] as String?,
      aboutUsUrl: json['aboutUsUrl'] as String?,
      termsConditionUrl: json['termsConditionUrl'] as String?,
      timeZoneLat: json['timeZoneLat'] as String?,
      timeZoneLong: json['timeZoneLong'] as String?,
    );

Map<String, dynamic> _$$EnvironmentModelImplToJson(
        _$EnvironmentModelImpl instance) =>
    <String, dynamic>{
      'appTitle': instance.appTitle,
      'groupKey': instance.groupKey,
      'groupChannelId': instance.groupChannelId,
      'groupChannelName': instance.groupChannelName,
      'appNameId': instance.appNameId,
      'environment': instance.environment,
      'baseUrl': instance.baseUrl,
      'iconLogo': instance.iconLogo,
      'iconSvg': instance.iconSvg,
      'applicationAndroidStoreId': instance.applicationAndroidStoreId,
      'applicationIOSStoreId': instance.applicationIOSStoreId,
      'aboutUsUrl': instance.aboutUsUrl,
      'termsConditionUrl': instance.termsConditionUrl,
      'timeZoneLat': instance.timeZoneLat,
      'timeZoneLong': instance.timeZoneLong,
    };
