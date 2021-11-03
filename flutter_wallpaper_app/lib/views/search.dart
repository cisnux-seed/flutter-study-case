import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/api/network_service.dart';
import 'package:flutter_wallpaper_app/models/wallpaper_list.dart';
import 'package:flutter_wallpaper_app/widget/generate_wallpaper.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  final String? searchTag;

  Search({required this.searchTag});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  List<WallpaperModel> searchWallpapers = [];
  GetApiData getApiData = GetApiData();

  @override
  void initState() {
    getApiData.setKeyword = widget.searchTag ?? "none";
    getApiData
        .getCategoryWallpapers()
        .then((element) => setState(() => searchWallpapers = element));
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
      backgroundColor: Colors.blue.shade900.withOpacity(0.55),
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
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search Wallpaper",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Icon(Icons.search),
                    ),
                    onTap: () => (_searchController.text.isNotEmpty)
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(
                                searchTag: _searchController.text,
                              ),
                            ),
                          )
                        : () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            generateWallpaper(wallpapers: searchWallpapers, context: context),
          ],
        ),
      ),
    );
  }
}
