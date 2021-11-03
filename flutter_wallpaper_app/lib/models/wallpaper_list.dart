import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_wallpaper_app/models/wallpaper_size.dart';
part 'wallpaper_list.g.dart';

@JsonSerializable()
class WallpaperModel {
  @JsonKey(required: true)
  String url;
  @JsonKey(required: true)
  String photographer;
  @JsonKey(name: 'photographer_url', required: true)
  String photographerUrl;
  @JsonKey(name: 'photographer_id', required: true)
  int photographerId;
  @JsonKey(required: true)
  SrcModel src;

  WallpaperModel(
      {required this.url,
      required this.photographer,
      required this.photographerId,
      required this.photographerUrl,
      required this.src});

  factory WallpaperModel.fromJson(Map<String, dynamic> json) =>
      _$WallpaperModelFromJson(json);
}
