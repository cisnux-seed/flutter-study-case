import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/models/wallpaper_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wallpaper_app/views/image_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget generateWallpaper({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.5),
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: StaggeredGridView.countBuilder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      itemCount: wallpapers.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(15.5),
            ),
            border: Border.all(width: 2.5, color: Colors.white),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, ImageView.routeName,
                    arguments: wallpapers[index].src.portrait),
                child: Hero(
                  tag: wallpapers[index].src.portrait,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(11.5)),
                    child: CachedNetworkImage(
                      imageUrl: wallpapers[index].src.portrait,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  wallpapers[index].photographer,
                  style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                margin: EdgeInsets.only(left: 8.0, bottom: 8.0, right: 4.0),
              )
            ],
          ),
        );
      },
      staggeredTileBuilder: (index) => StaggeredTile.count(
        ((index + 1) % 6 != 0) ? 1 : 2,
        (index + 1).isOdd ? 1.2 : 1.8,
      ),
    ),
  );
}
