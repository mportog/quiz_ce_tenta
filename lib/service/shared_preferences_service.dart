import 'package:ce_tenta_quizz/interface/shared_preferences_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService implements ISaredPrefsServiceInterface {
  static final SharedPrefsService instance = SharedPrefsService._();
  SharedPrefsService._();

  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    shared.get(key);
  }

  @override
  Future put(String key, value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is bool) {
      shared.setBool(key, value);
    } else if (value is double) {
      shared.setDouble(key, value);
    } else if (value is int) {
      shared.setInt(key, value);
    } else if (value is String) {
      shared.setString(key, value);
    }
  }
}
