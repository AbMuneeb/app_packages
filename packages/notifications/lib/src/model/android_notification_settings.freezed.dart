// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'android_notification_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AndroidNotificationSettings _$AndroidNotificationSettingsFromJson(
    Map<String, dynamic> json) {
  return _AndroidNotificationSettingsData.fromJson(json);
}

/// @nodoc
mixin _$AndroidNotificationSettings {
  String get groupKey => throw _privateConstructorUsedError;
  String get groupChannelId => throw _privateConstructorUsedError;
  String get groupChannelName => throw _privateConstructorUsedError;
  String get notificationRingingTone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AndroidNotificationSettingsCopyWith<AndroidNotificationSettings>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidNotificationSettingsCopyWith<$Res> {
  factory $AndroidNotificationSettingsCopyWith(
          AndroidNotificationSettings value,
          $Res Function(AndroidNotificationSettings) then) =
      _$AndroidNotificationSettingsCopyWithImpl<$Res,
          AndroidNotificationSettings>;
  @useResult
  $Res call(
      {String groupKey,
      String groupChannelId,
      String groupChannelName,
      String notificationRingingTone});
}

/// @nodoc
class _$AndroidNotificationSettingsCopyWithImpl<$Res,
        $Val extends AndroidNotificationSettings>
    implements $AndroidNotificationSettingsCopyWith<$Res> {
  _$AndroidNotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupKey = null,
    Object? groupChannelId = null,
    Object? groupChannelName = null,
    Object? notificationRingingTone = null,
  }) {
    return _then(_value.copyWith(
      groupKey: null == groupKey
          ? _value.groupKey
          : groupKey // ignore: cast_nullable_to_non_nullable
              as String,
      groupChannelId: null == groupChannelId
          ? _value.groupChannelId
          : groupChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      groupChannelName: null == groupChannelName
          ? _value.groupChannelName
          : groupChannelName // ignore: cast_nullable_to_non_nullable
              as String,
      notificationRingingTone: null == notificationRingingTone
          ? _value.notificationRingingTone
          : notificationRingingTone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidNotificationSettingsDataImplCopyWith<$Res>
    implements $AndroidNotificationSettingsCopyWith<$Res> {
  factory _$$AndroidNotificationSettingsDataImplCopyWith(
          _$AndroidNotificationSettingsDataImpl value,
          $Res Function(_$AndroidNotificationSettingsDataImpl) then) =
      __$$AndroidNotificationSettingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String groupKey,
      String groupChannelId,
      String groupChannelName,
      String notificationRingingTone});
}

/// @nodoc
class __$$AndroidNotificationSettingsDataImplCopyWithImpl<$Res>
    extends _$AndroidNotificationSettingsCopyWithImpl<$Res,
        _$AndroidNotificationSettingsDataImpl>
    implements _$$AndroidNotificationSettingsDataImplCopyWith<$Res> {
  __$$AndroidNotificationSettingsDataImplCopyWithImpl(
      _$AndroidNotificationSettingsDataImpl _value,
      $Res Function(_$AndroidNotificationSettingsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupKey = null,
    Object? groupChannelId = null,
    Object? groupChannelName = null,
    Object? notificationRingingTone = null,
  }) {
    return _then(_$AndroidNotificationSettingsDataImpl(
      groupKey: null == groupKey
          ? _value.groupKey
          : groupKey // ignore: cast_nullable_to_non_nullable
              as String,
      groupChannelId: null == groupChannelId
          ? _value.groupChannelId
          : groupChannelId // ignore: cast_nullable_to_non_nullable
              as String,
      groupChannelName: null == groupChannelName
          ? _value.groupChannelName
          : groupChannelName // ignore: cast_nullable_to_non_nullable
              as String,
      notificationRingingTone: null == notificationRingingTone
          ? _value.notificationRingingTone
          : notificationRingingTone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AndroidNotificationSettingsDataImpl
    with DiagnosticableTreeMixin
    implements _AndroidNotificationSettingsData {
  const _$AndroidNotificationSettingsDataImpl(
      {required this.groupKey,
      required this.groupChannelId,
      required this.groupChannelName,
      required this.notificationRingingTone});

  factory _$AndroidNotificationSettingsDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AndroidNotificationSettingsDataImplFromJson(json);

  @override
  final String groupKey;
  @override
  final String groupChannelId;
  @override
  final String groupChannelName;
  @override
  final String notificationRingingTone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AndroidNotificationSettings(groupKey: $groupKey, groupChannelId: $groupChannelId, groupChannelName: $groupChannelName, notificationRingingTone: $notificationRingingTone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AndroidNotificationSettings'))
      ..add(DiagnosticsProperty('groupKey', groupKey))
      ..add(DiagnosticsProperty('groupChannelId', groupChannelId))
      ..add(DiagnosticsProperty('groupChannelName', groupChannelName))
      ..add(DiagnosticsProperty(
          'notificationRingingTone', notificationRingingTone));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidNotificationSettingsDataImpl &&
            (identical(other.groupKey, groupKey) ||
                other.groupKey == groupKey) &&
            (identical(other.groupChannelId, groupChannelId) ||
                other.groupChannelId == groupChannelId) &&
            (identical(other.groupChannelName, groupChannelName) ||
                other.groupChannelName == groupChannelName) &&
            (identical(
                    other.notificationRingingTone, notificationRingingTone) ||
                other.notificationRingingTone == notificationRingingTone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, groupKey, groupChannelId,
      groupChannelName, notificationRingingTone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidNotificationSettingsDataImplCopyWith<
          _$AndroidNotificationSettingsDataImpl>
      get copyWith => __$$AndroidNotificationSettingsDataImplCopyWithImpl<
          _$AndroidNotificationSettingsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AndroidNotificationSettingsDataImplToJson(
      this,
    );
  }
}

abstract class _AndroidNotificationSettingsData
    implements AndroidNotificationSettings {
  const factory _AndroidNotificationSettingsData(
          {required final String groupKey,
          required final String groupChannelId,
          required final String groupChannelName,
          required final String notificationRingingTone}) =
      _$AndroidNotificationSettingsDataImpl;

  factory _AndroidNotificationSettingsData.fromJson(Map<String, dynamic> json) =
      _$AndroidNotificationSettingsDataImpl.fromJson;

  @override
  String get groupKey;
  @override
  String get groupChannelId;
  @override
  String get groupChannelName;
  @override
  String get notificationRingingTone;
  @override
  @JsonKey(ignore: true)
  _$$AndroidNotificationSettingsDataImplCopyWith<
          _$AndroidNotificationSettingsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
