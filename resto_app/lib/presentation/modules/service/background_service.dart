import 'package:resto_app/data/api/api_service.dart';
import '../home/utils/notification_helper.dart';
import 'init_services.dart';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:http/http.dart' as http;

class BackgroundService {
  static BackgroundService? _instance;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;
  final ReceivePort _port = ReceivePort();
  static final _client = http.Client();

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      _port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print('Show Promo Notification!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    var _data = await ApiService().getAllRestaurant(_client);

    _data.fold((failed) {
      print('Error => ${failed.title}');
    }, (success) async {
      var result = success;
      await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin,
        result[Random().nextInt(result.length - 1)],
      );
      _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
      _uiSendPort?.send(null);
    });
  }
}
