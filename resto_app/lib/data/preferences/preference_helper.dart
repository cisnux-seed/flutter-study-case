import 'package:get_storage/get_storage.dart';

class PreferencesHelper {
  final prefs = GetStorage();
  static const DAILY_PROMO = 'DAILY_NEWS';

  Future<bool> isDailyPromoActive() async => prefs.read(DAILY_PROMO) ?? false;

  void setDailyPromo(bool value) async => prefs.write(DAILY_PROMO, value);
}
