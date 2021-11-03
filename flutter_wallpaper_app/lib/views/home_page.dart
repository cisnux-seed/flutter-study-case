import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/api/network_service.dart';
import 'package:flutter_wallpaper_app/models/wallpaper_list.dart';
import 'package:flutter_wallpaper_app/views/search.dart';
import 'package:flutter_wallpaper_app/widget/generete_category.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_wallpaper_app/models/categories.dart';
import 'package:flutter_wallpaper_app/models/picture_categories.dart';
import 'package:flutter_wallpaper_app/widget/generate_wallpaper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var getApiData = GetApiData();
  TextEditingController _searchController = TextEditingController();
  List<CategoriesModel> categories = [];
  List<WallpaperModel> latestWallpapers = [];

  @override
  void initState() {
    super.initState();
    print('initState');
    categories = getCategories();
    getApiData
        .getLatestWallpaper()
        .then((element) => setState(() => latestWallpapers = element));
  }

  @override
  void dispose() {
    print('dispose');
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900.withOpacity(0.55),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cx Wallpaper",
          style: GoogleFonts.pattaya(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
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
                        ? Navigator.push(
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
            SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 80,
                  childAspectRatio: 7 / 4,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: CategoriesTile(
                      title: categories[index].categoriesName,
                      imgUrl: categories[index].imgUrl,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              margin: EdgeInsets.only(left: 28.0),
              alignment: Alignment.topLeft,
              child: Text(
                "Latest Wallpapers",
                style: GoogleFonts.pattaya(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            generateWallpaper(wallpapers: latestWallpapers, context: context),
            SizedBox(height: 8.0),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Created by ",
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade200,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "Fajra Risqulla",
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
