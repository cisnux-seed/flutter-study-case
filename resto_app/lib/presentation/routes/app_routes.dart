import 'package:resto_app/presentation/modules/profile/binding/resto_profile_binding.dart';
import 'package:resto_app/presentation/modules/auth/bindings/reset_pasword_binding.dart';
import 'package:resto_app/presentation/modules/profile/view/resto_profile_view.dart';
import 'package:resto_app/presentation/modules/auth/bindings/register_binding.dart';
import 'package:resto_app/presentation/modules/auth/views/reset_password_view.dart';
import 'package:resto_app/presentation/modules/splash/binding/splash_binding.dart';
import 'package:resto_app/presentation/modules/search/binding/search_binding.dart';
import 'package:resto_app/presentation/modules/auth/bindings/login_binding.dart';
import 'package:resto_app/presentation/modules/home/binding/home_binding.dart';
import 'package:resto_app/presentation/modules/auth/views/register_view.dart';
import 'package:resto_app/presentation/modules/splash/view/splash_view.dart';
import 'package:resto_app/presentation/modules/search/view/search_view.dart';
import 'package:resto_app/presentation/modules/auth/views/login_view.dart';
import 'package:resto_app/presentation/modules/home/views/home_view.dart';
import 'package:resto_app/presentation/routes/app_views.dart';
import 'package:get/get.dart';

/// set up all routes app and transition
abstract class AppViews {
  static final appViews = [
    GetPage(
      name: RouteName.splashView,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.homeView,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteName.restoProfileView,
      page: () => RestoProfileView(),
      binding: RestoProfileBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RouteName.searchView,
      page: () => SearchView(),
      binding: SearchBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteName.loginView,
      page: () => LoginView(),
      transition: Transition.native,
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.registerView,
      page: () => RegisterView(),
      transition: Transition.rightToLeft,
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RouteName.resetPasswordView,
      page: () => ResetPasswordView(),
      transition: Transition.rightToLeft,
      binding: ResetPasswordBinding(),
    ),
  ];
}
