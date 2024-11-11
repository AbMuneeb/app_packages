import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment_model.freezed.dart';
part 'environment_model.g.dart';

@freezed
class EnvironmentModel with _$EnvironmentModel
{
  const factory EnvironmentModel({
    required String appTitle,
    String? groupKey,
    String? groupChannelId,
    String? groupChannelName,
    String? appNameId,
    required String environment,
    required String baseUrl,
    required String iconLogo,
    required String iconSvg,
    String? applicationAndroidStoreId,
    String? applicationIOSStoreId,
    String? aboutUsUrl,
    String? termsConditionUrl,
    String? timeZoneLat,
    String? timeZoneLong,
  }) = _EnvironmentModel;

  factory EnvironmentModel.fromJson(Map<String, Object?> json) => _$EnvironmentModelFromJson(json);
}
