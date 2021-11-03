import 'package:resto_app/presentation/modules/home/utils/notification_date_time.dart';
import 'package:resto_app/presentation/modules/service/background_service.dart';
import 'package:resto_app/data/preferences/preference_helper.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:resto_app/presentation/routes/app_views.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:resto_app/data/db/database_repo.dart';
import 'package:resto_app/data/models/model_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resto_app/domain/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserProfileState { Loading, Success }

class UserProfileController extends GetxController {
  final _isPromoActive = Rx<bool>(false);
  final _prefHelper = PreferencesHelper();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late final Rx<UserProfile> _userProfile;
  final _favoritesResto = Rx<List<Restaurant>>([]);
  final _userProfileState = Rx<UserProfileState>(UserProfileState.Loading);

  bool get isPromoActive => _isPromoActive.value;
  set isPromoActive(bool isPromoActive) => _isPromoActive.value = isPromoActive;

  @override
  void onInit() async {
    super.onInit();
    _favoritesResto.bindStream(_getFavoritesResto());
    await _getPromoStatus();
    await getDisplayName();
  }

  List<Restaurant> get favoritesResto => _favoritesResto.value;
  set favoritesResto(List<Restaurant> favoritesResto) =>
      _favoritesResto.value = favoritesResto;

  UserProfileState get userProfileState => _userProfileState.value;
  set userProfileState(UserProfileState userProfileState) =>
      _userProfileState.value = userProfileState;

  Future<void> _getPromoStatus() async =>
      isPromoActive = await _prefHelper.isDailyPromoActive();

  void saveRestoPromoNotif(bool value) {
    isPromoActive = value;
    _prefHelper.setDailyPromo(value);
  }

  Future<void> scheduledDailyPromo() async {
    if (isPromoActive) {
      print('Scheduling Daily Promo Actived');
      await AndroidAlarmManager.periodic(
        Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeService.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      await _cancelAndroidAlarmManager();
    }
  }

  Future<void> logout() async {
    saveRestoPromoNotif(false);
    Get.offAllNamed(RouteName.loginView);
    await _cancelAndroidAlarmManager();
    await AuthUser.signOut();
  }

  Future<void> _cancelAndroidAlarmManager() async {
    print('Scheduling Daily Promo Canceled');
    await AndroidAlarmManager.cancel(1);
  }

  Future<void> linkWithGmailAccount() async {
    var data = await AuthUser.linkWithGmail();
    data.fold(
      (failed) => Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: failed.title!,
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.primaryColor,
        ),
        middleText: failed.message!,
        middleTextStyle: Get.textTheme.bodyText1!,
      ),
      (_) {},
    );
  }

  UserProfile get userProfile => _userProfile.value;
  set userProfile(UserProfile userProfile) => _userProfile.value = userProfile;

  String get currentEmail => AuthUser.auth.currentUser!.email!;
  Future<void> getDisplayName() async {
    userProfileState = UserProfileState.Loading;
    var dbResult = await _databaseHelper.readUserProfile(
        uid: AuthUser.auth.currentUser!.uid);
    dbResult.fold(
        (failed) => Get.defaultDialog(
              titlePadding: EdgeInsets.only(top: 20.0),
              title: failed.title!,
              titleStyle: Get.textTheme.headline6!.copyWith(
                color: Get.theme.primaryColor,
              ),
              middleText: failed.message!,
              middleTextStyle: Get.textTheme.bodyText1!,
            ), (success) async {
      _userProfile = Rx<UserProfile>(UserProfile.fromJson(success));
      userProfileState = UserProfileState.Success;
    });
  }

  Stream<List<Restaurant>> _getFavoritesResto() {
    late Stream<DocumentSnapshot<Map<String, dynamic>>> streamData;

    var dbResult =
        _databaseHelper.readFavoritesResto(uid: AuthUser.auth.currentUser!.uid);
    dbResult.fold(
        (failed) => Get.defaultDialog(
              titlePadding: EdgeInsets.only(top: 20.0),
              title: failed.title!,
              titleStyle: Get.textTheme.headline6!.copyWith(
                color: Get.theme.primaryColor,
              ),
              middleText: failed.message!,
              middleTextStyle: Get.textTheme.bodyText1!,
            ),
        (stream) => streamData = stream);
    return streamData.map((doc) => (doc.data()!['favoritesRestaurant']
            as List<dynamic>)
        .map((element) =>
            Restaurant.fromAllRestaurantJson(element as Map<String, dynamic>))
        .toList());
  }
}
