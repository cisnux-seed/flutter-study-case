import 'package:get/route_manager.dart';
import 'package:note_app/modules/add/bindings/add_binding.dart';
import 'package:note_app/modules/add/views/add_view.dart';
import 'package:note_app/modules/home/views/home_view.dart';
import 'package:note_app/modules/profile/bindings/profile_binding.dart';
import 'package:note_app/modules/profile/views/profile_view.dart';
import 'package:note_app/modules/search/bindings/search_binding.dart';
import 'package:note_app/modules/search/views/search_view.dart';
import 'package:note_app/routes/app_routes.dart';

/// Route and Transition App
abstract class AppRoute {
  static final appViews = [
    GetPage(
      name: RouteName.homeView,
      page: () => HomeView(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteName.addView,
      page: () => AddNote(),
      binding: AddBinding(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: RouteName.profileView,
      page: () => NoteProfileView(),
      binding: ProfileBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RouteName.searchView,
      page: () => SearchView(),
      binding: SearchBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
