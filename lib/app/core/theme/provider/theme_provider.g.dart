// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeStateImpl _$$ThemeStateImplFromJson(Map<String, dynamic> json) =>
    _$ThemeStateImpl(
      data: const ThemeDataConverter().fromJson(json['data'] as String),
      scope: $enumDecode(_$ThemeScopeEnumMap, json['scope']),
    );

Map<String, dynamic> _$$ThemeStateImplToJson(_$ThemeStateImpl instance) =>
    <String, dynamic>{
      'data': const ThemeDataConverter().toJson(instance.data),
      'scope': _$ThemeScopeEnumMap[instance.scope]!,
    };

const _$ThemeScopeEnumMap = {
  ThemeScope.system: 'system',
  ThemeScope.user: 'user',
};
