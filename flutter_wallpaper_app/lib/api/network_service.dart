import 'package:flutter_wallpaper_app/models/wallpaper_list.dart';
import 'package:flutter_wallpaper_app/models/picture_categories.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class GetApiData {
  String? keyword;

  set setKeyword(String keyword) {
    this.keyword = keyword;
  }

  Future<List<WallpaperModel>> getLatestWallpaper() async {
    List<WallpaperModel> latestWallpapers = [];
    await http.get(
        Uri.https('api.pexels.com', '/v1/curated', {
          'per_page': '30',
          'page': '40',
        }),
        headers: {
          HttpHeaders.authorizationHeader: apiKey,
          HttpHeaders.contentTypeHeader: 'application/json',
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        WallpaperModel wallpaperModel;
        wallpaperModel = WallpaperModel.fromJson(element);
        latestWallpapers.add(wallpaperModel);
      });
    });
    return latestWallpapers;
  }

  Future<List<WallpaperModel>> getCategoryWallpapers() async {
    List<WallpaperModel> categoryWallpapers = [];
    await http.get(
        Uri.https('api.pexels.com', '/v1/search', {
          'query': '${this.keyword}',
          'per_page': '40',
          'page': '1',
        }),
        headers: {
          HttpHeaders.authorizationHeader: apiKey,
          HttpHeaders.contentTypeHeader: 'application/json',
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        WallpaperModel wallpaperModel;
        wallpaperModel = WallpaperModel.fromJson(element);
        categoryWallpapers.add(wallpaperModel);
      });
    });
    return categoryWallpapers;
  }
}
