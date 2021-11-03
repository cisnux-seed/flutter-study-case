import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/views/home_page.dart';
import 'package:flutter_wallpaper_app/views/image_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cx Wallpaper",
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage(),
      routes: {
        ImageView.routeName: (context) => ImageView(),
      },
    );
  }
}
