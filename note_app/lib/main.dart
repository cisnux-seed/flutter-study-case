import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:note_app/modules/bindings/database_binding.dart';
import 'package:note_app/modules/utils/theme_data.dart';
import 'package:note_app/routes/app_routes.dart';
import 'package:note_app/routes/app_views.dart';

void main() {
  /// connected flutter and native
  WidgetsFlutterBinding.ensureInitialized();

  /// to avoid landscape
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

/// widget tree root
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.homeView,
      initialBinding: DatabaseBinding(),
      theme: ThemeStyle.styles,
      getPages: AppRoute.appViews,
    );
  }
}
