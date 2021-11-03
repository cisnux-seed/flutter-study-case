// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallpaperModel _$WallpaperModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'url',
    'photographer',
    'photographer_url',
    'photographer_id',
    'src'
  ]);
  return WallpaperModel(
    url: json['url'] as String,
    photographer: json['photographer'] as String,
    photographerId: json['photographer_id'] as int,
    photographerUrl: json['photographer_url'] as String,
    src: SrcModel.fromJson(json['src'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WallpaperModelToJson(WallpaperModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographerUrl,
      'photographer_id': instance.photographerId,
      'src': instance.src,
    };
