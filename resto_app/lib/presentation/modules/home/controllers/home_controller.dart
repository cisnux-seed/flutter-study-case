import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:resto_app/presentation/routes/app_views.dart';
import 'package:http/http.dart' as http;

enum HomeResultState { Loading, HasData }

class HomeController extends GetxController {
  final _recommendedResto = Rx<List<Restaurant>>([]);
  final _allResto = Rx<List<Restaurant>>([]);
  final _homeResultState = Rx<HomeResultState>(HomeResultState.Loading);
  final _bottomNavIndex = Rx<int>(0);
  final _payload = Rxn<String>();
  final _client = http.Client();

  @override
  void onInit() async {
    super.onInit();

    /// to handle promo notifications
    debounce(
      _payload,
      (_) => Get.toNamed(RouteName.restoProfileView, arguments: payload),
    );
    await _setAllResto();
    _setRecomendedResto();
  }

  @override
  void onClose() async {
    super.onClose();
  }

  String get payload => _payload.value!;
  set payload(String payload) => _payload.value = payload;

  int get bottomNavIndex => _bottomNavIndex.value;
  set bottomNavIndex(int bottomNavIndex) =>
      _bottomNavIndex.value = bottomNavIndex;

  List<Restaurant> get recommendedResto => _recommendedResto.value;
  set recommendedResto(List<Restaurant> recommendedResto) =>
      _recommendedResto.value = recommendedResto;

  List<Restaurant> get allResto => _allResto.value;
  set allResto(List<Restaurant> allResto) => _allResto.value = allResto;

  HomeResultState get homeResultState => _homeResultState.value;
  set homeResultState(HomeResultState homeResultState) =>
      _homeResultState.value = homeResultState;

  void _setRecomendedResto() {
    recommendedResto = allResto
        .where(
          (resto) => resto.rating >= 4.2,
        )
        .toList();
  }

  Future<void> _setAllResto() async {
    homeResultState = HomeResultState.Loading;
    var data = await ApiService().getAllRestaurant(_client);

    data.fold((failed) {
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: failed.title!,
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.primaryColor,
        ),
        middleText: failed.message!,
        middleTextStyle: Get.textTheme.bodyText1!,
      );
    }, (success) {
      allResto = success;
      homeResultState = HomeResultState.HasData;
    });
  }
}
