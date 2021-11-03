import 'package:resto_app/data/models/model_customer_review.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:resto_app/data/db/database_repo.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/domain/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

enum ProfileRestoState { Loading, HasData }
enum PostReviewState { OnPost, Success }

class RestoProfileContoller extends GetxController {
  late final Rx<Restaurant> _restaurant;
  final _detailRestoId = Rx<String>(Get.arguments);
  late final TextEditingController _usernameController;
  late final TextEditingController _reviewController;
  final _isFavoriteResto = Rx<bool>(false);
  final _customerReviews = Rx<List<CustomerReviews>>([]);
  final _profileRestoState = Rx<ProfileRestoState>(ProfileRestoState.Loading);
  final _postReviewState = Rx<PostReviewState>(PostReviewState.OnPost);
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final _client = http.Client();

  @override
  void onInit() async {
    super.onInit();
    _usernameController = TextEditingController();
    _reviewController = TextEditingController();
    await _getFavoriteRestoStatus();
    await _setDetailRestaurant();
  }

  @override
  void onClose() {
    _usernameController.dispose();
    _reviewController.dispose();
    super.onClose();
  }

  TextEditingController get usernameController => _usernameController;
  TextEditingController get reviewController => _reviewController;

  List<CustomerReviews> get customerReviews => _customerReviews.value;
  set customerReviews(List<CustomerReviews> customerReviews) =>
      _customerReviews.value = customerReviews;

  bool get isFavoriteResto => _isFavoriteResto.value;
  set isFavoriteResto(bool isFavorite) => _isFavoriteResto.value = isFavorite;

  String get detailRestoId => _detailRestoId.value;
  set detailId(String detailRestoId) => _detailRestoId.value = detailRestoId;

  Restaurant get restaurant => _restaurant.value;
  set restaurant(restaurant) => _restaurant.value = restaurant;

  ProfileRestoState get profileRestoState => _profileRestoState.value;
  set profileRestoState(ProfileRestoState profileRestoState) =>
      _profileRestoState.value = profileRestoState;

  PostReviewState get postReviewState => _postReviewState.value;
  set postReviewState(PostReviewState profileRestoState) =>
      _postReviewState.value = profileRestoState;

  Future<void> _getFavoriteRestoStatus() async {
    var dbResult = await _databaseHelper.readRestoById(
      uid: AuthUser.auth.currentUser!.uid,
      id: detailRestoId,
    );

    dbResult.fold(
      (failed) => Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: failed.title!,
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.colorScheme.secondary,
        ),
        middleText: failed.message!,
        middleTextStyle: Get.textTheme.bodyText1!,
      ),
      (status) => isFavoriteResto = status,
    );
  }

  Future<void> addFavoriteResto() async {
    isFavoriteResto = true;
    var dbResult = await _databaseHelper.insertRestaurant(
        restaurant: restaurant, uid: AuthUser.auth.currentUser!.uid);
    dbResult.fold(
        (failed) => Get.defaultDialog(
              titlePadding: EdgeInsets.only(top: 20.0),
              title: failed.title!,
              titleStyle: Get.textTheme.headline6!.copyWith(
                color: Get.theme.colorScheme.secondary,
              ),
              middleText: failed.message!,
              middleTextStyle: Get.textTheme.bodyText1!,
            ),
        (_) {});
  }

  Future<void> removeFavoriteResto() async {
    isFavoriteResto = false;
    var dbResult = await _databaseHelper.removeFavoritesResto(
      restaurant: restaurant,
      uid: AuthUser.auth.currentUser!.uid,
    );

    dbResult.fold(
        (failed) => Get.defaultDialog(
              titlePadding: EdgeInsets.only(top: 20.0),
              title: failed.title!,
              titleStyle: Get.textTheme.headline6!.copyWith(
                color: Get.theme.colorScheme.secondary,
              ),
              middleText: failed.message!,
              middleTextStyle: Get.textTheme.bodyText1!,
            ),
        (_) {});
  }

  Future<void> _setDetailRestaurant() async {
    profileRestoState = ProfileRestoState.Loading;
    postReviewState = PostReviewState.OnPost;
    var data = await ApiService().getDetailRestaurant(detailRestoId, _client);

    data.fold((failed) {
      Get.defaultDialog(
          barrierDismissible: false,
          titlePadding: EdgeInsets.only(top: 20.0),
          title: failed.title!,
          titleStyle: Get.textTheme.headline6!.copyWith(
            color: Get.theme.colorScheme.secondary,
          ),
          middleText: failed.message!,
          middleTextStyle: Get.textTheme.bodyText1!,
          confirmTextColor: Colors.white,
          buttonColor: Get.theme.primaryColor,
          textConfirm: 'Back',
          onConfirm: () {
            Get.back();
            Get.back();
          });
    }, (success) {
      _restaurant = Rx<Restaurant>(success);
      customerReviews = restaurant.customerReviews;
      profileRestoState = ProfileRestoState.HasData;
      postReviewState = PostReviewState.Success;
    });
  }

  Future<void> postRestoReview({
    required String name,
    required String review,
  }) async {
    if (review.isNotEmpty) {
      postReviewState = PostReviewState.OnPost;
      var data = await ApiService()
          .postRestoReview(detailRestoId, name, review, _client);

      data.fold((failed) {
        Get.defaultDialog(
          titlePadding: EdgeInsets.only(top: 20.0),
          title: failed.title!,
          titleStyle: Get.textTheme.headline6!.copyWith(
            color: Get.theme.colorScheme.secondary,
          ),
          middleText: failed.message!,
          middleTextStyle: Get.textTheme.bodyText1!,
        );
      }, (success) {
        customerReviews = success;
        postReviewState = PostReviewState.Success;
      });
    }
  }
}
