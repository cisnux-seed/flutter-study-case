import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/models/wallpaper_list.dart';
import 'package:flutter_wallpaper_app/widget/generate_wallpaper.dart';
import 'package:flutter_wallpaper_app/api/network_service.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  final String? categoryName;
  final Color? backgroundColor;

  @override
  Categories({required this.categoryName, required this.backgroundColor});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  TextEditingController _searchController = TextEditingController();
  List<WallpaperModel> categoryWallpapers = [];
  GetApiData getApiData = GetApiData();

  @override
  void initState() {
    getApiData.setKeyword = widget.categoryName ?? "none";
    getApiData
        .getCategoryWallpapers()
        .then((element) => setState(() => categoryWallpapers = element));
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Cx Wallpaper",
          style: GoogleFonts.pattaya(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 16.0),
              generateWallpaper(
                  wallpapers: categoryWallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
