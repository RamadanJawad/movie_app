import 'package:movie_app/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/constants.dart';

class AppSettingsPrefs {
  final SharedPreferences _sharedPreferences;

  AppSettingsPrefs(this._sharedPreferences);

  String getLocale() {
    return _sharedPreferences
        .getString(Constants.prefKeyLocale)
        .pareWithDefaultLocale();
  }

  Future<void> setLocale(String locale) async {
    await _sharedPreferences.setString(Constants.prefKeyLocale, locale);
  }

  Future<void> setAppTheme(String theme) async {
    await _sharedPreferences.setString(Constants.prefKeyTheme, theme);
  }

  String getAppTheme() {
    return _sharedPreferences.getString(Constants.prefKeyTheme).toString();
  }
}
