import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:resto_app/common/custom_error_handling.dart';
import 'package:http/http.dart' as http;

enum SearchResultState { Loading, HasData, HasNoData }

class SearchController extends GetxController {
  late final TextEditingController _searchController;
  final _restoBySearch = Rx<List<Restaurant>>([]);
  final _searchResultState = Rx<SearchResultState>(SearchResultState.HasNoData);
  final _errorMessage = Rx<String>('');
  final _client = http.Client();

  @override
  void onInit() {
    super.onInit();
    _searchController = TextEditingController();
  }

  @override
  void onClose() {
    _searchController.dispose();
    super.onClose();
  }

  TextEditingController get searchController => _searchController;

  List<Restaurant> get restoBySearch => _restoBySearch.value;
  set restoBySearch(List<Restaurant> restoBySearch) =>
      _restoBySearch.value = restoBySearch;

  SearchResultState get searchResultState => _searchResultState.value;
  set searchResultState(SearchResultState searchResultState) =>
      _searchResultState.value = searchResultState;

  String get errorMessage => _errorMessage.value;
  set errorMessage(String errorMessage) => _errorMessage.value = errorMessage;

  Future<void> setRestoBySearch(String keyword) async {
    if (keyword.isEmpty) {
      restoBySearch = [];
      searchResultState = SearchResultState.HasNoData;
    } else {
      searchResultState = SearchResultState.Loading;
      late final Either<RestoAppException, List<Restaurant>> data;
      await Future.delayed(
        Duration(seconds: 2),
        () async =>
            data = await ApiService().getRestaurantBySearch(keyword, _client),
      );

      data.fold((failed) {
        Get.defaultDialog(
            titlePadding: EdgeInsets.only(top: 20.0),
            title: failed.title!,
            titleStyle: Get.textTheme.headline6!.copyWith(
              color: Get.theme.colorScheme.secondary,
            ),
            middleText: failed.message!,
            middleTextStyle: Get.textTheme.bodyText1!,
            confirmTextColor: Colors.white,
            textConfirm: 'Back',
            onConfirm: () {
              Get.back();
              Get.back();
            });
      }, (success) {
        if (success.isEmpty) {
          searchResultState = SearchResultState.HasNoData;
        } else {
          restoBySearch = success;
          searchResultState = SearchResultState.HasData;
        }
      });
    }
  }
}
