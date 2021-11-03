import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/views/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesTile extends StatelessWidget {
  final String? imgUrl;
  final String? title;

  CategoriesTile({@required this.title, @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Categories(
            categoryName: (title ?? 'failed load data').toLowerCase(),
            backgroundColor: checkColor(title ?? 'failed load data'),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: CachedNetworkImage(
                imageUrl: imgUrl ?? "failed load data",
                fit: BoxFit.cover,
                height: 73.0,
                width: 100.0,
              ),
            ),
            Container(
              height: 73.0,
              width: 100.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: Colors.black26,
                border: Border.all(width: 2.0, color: Colors.white),
              ),
              child: Text(
                title ?? 'failed load data',
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  Color checkColor(String title) {
    if (title.toLowerCase() == 'art') {
      return Colors.blue.shade800.withOpacity(0.6);
    } else if (title.toLowerCase() == 'code') {
      return Colors.blue.shade700.withOpacity(0.3);
    } else if (title.toLowerCase() == 'nature') {
      return Colors.green.shade900;
    } else if (title.toLowerCase() == 'neon city') {
      return Colors.black87;
    } else if (title.toLowerCase() == 'motivation') {
      return Colors.grey.shade800.withOpacity(0.65);
    } else if (title.toLowerCase() == 'coffee') {
      return Colors.brown.withOpacity(0.5);
    }
    return Colors.white;
  }
}
