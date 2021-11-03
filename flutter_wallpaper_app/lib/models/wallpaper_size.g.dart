// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SrcModel _$SrcModelFromJson(Map<String, dynamic> json) {
  return SrcModel(
    portrait: json['portrait'] as String,
    landscape: json['landscape'] as String,
    large: json['large'] as String,
    medium: json['medium'] as String,
  );
}

Map<String, dynamic> _$SrcModelToJson(SrcModel instance) => <String, dynamic>{
      'portrait': instance.portrait,
      'large': instance.large,
      'landscape': instance.landscape,
      'medium': instance.medium,
    };
