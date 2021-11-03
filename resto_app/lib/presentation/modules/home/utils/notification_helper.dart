import 'package:resto_app/presentation/modules/home/controllers/home_controller.dart';
import 'package:resto_app/presentation/modules/utils/resto_image_format.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:io';

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) async =>
          Get.find<HomeController>().payload = payload ?? 'empty load',
    );
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    var response = await http.get(Uri.parse(url));
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<void> showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    Restaurant restaurant,
  ) async {
    var _channelId = "1";
    var _channelName = "Cx Resto Daily Promo";
    var _channelDescription = "Promo Restaurant";
    var _restoPicturePath = await _downloadAndSaveFile(
      RestoImageFormat.smallImage(restaurant.pictureId),
      'resto${restaurant.pictureId}.jpg',
    );

    var bigPictureAndroidStyle = BigPictureStyleInformation(
      FilePathAndroidBitmap(_restoPicturePath),
      contentTitle: "<b>Daily Promo</b>",
      htmlFormatContentTitle: true,
      summaryText: "${restaurant.name} Special Discount <b>15% Off</b>",
      htmlFormatSummaryText: true,
    );

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('promo_notif'),
      ticker: 'Daily Promo',
      styleInformation: bigPictureAndroidStyle,
      playSound: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Daily Promo',
      "${restaurant.name} Special Discount 15% Off",
      platformChannelSpecifics,
      payload: restaurant.id,
    );
  }
}
