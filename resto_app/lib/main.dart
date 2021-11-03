import 'package:resto_app/presentation/routes/app_routes.dart';
import 'package:resto_app/presentation/routes/app_views.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'presentation/modules/service/init_services.dart';
import 'presentation/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// this app is only made for android
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initServices();
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 680),
      builder: () => GetMaterialApp(
        theme: styles,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splashView,
        getPages: AppViews.appViews,
      ),
    );
  }
}
