import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  late SharedPreferences _pref;

  AppPreferences._internal();
  static AppPreferences get instance => _instance;
  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> save<T>(String key, T value) async {
    if (value is int) return await _pref.setInt(key, value);
    if (value is double) return await _pref.setDouble(key, value);
    if (value is bool) return await _pref.setBool(key, value);
    if (value is String) return await _pref.setString(key, value);
    if (value is List<String>) return await _pref.setStringList(key, value);
    throw UnsupportedError('Unsupported type');
  }

  T? get<T>(String key) {
    final value = _pref.get(key);
    if (value is T) {
      return value;
    }
    return null;
  }

  Future<bool> remove(String key) async => await _pref.remove(key);
  Future<bool> clearData() async => await _pref.clear();
}
