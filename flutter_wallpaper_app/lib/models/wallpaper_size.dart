import 'package:json_annotation/json_annotation.dart';
part 'wallpaper_size.g.dart';

@JsonSerializable()
class SrcModel {
  final String portrait;
  final String large;
  final String landscape;
  final String medium;

  SrcModel(
      {required this.portrait,
      required this.landscape,
      required this.large,
      required this.medium});

  factory SrcModel.fromJson(Map<String, dynamic> json) =>
      _$SrcModelFromJson(json);
}
