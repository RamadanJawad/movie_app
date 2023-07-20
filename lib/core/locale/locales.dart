import 'package:flutter/material.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/config/dependency_injection.dart';
import 'package:movie_app/core/storage/local/app_settings_prefs.dart';

LocaleSettings localeSettings = LocaleSettings();

class LocaleSettings {
  final AppSettingsPrefs settingsPrefs;

  LocaleSettings() : settingsPrefs = instance<AppSettingsPrefs>();

  static const Map<String, String> languages = {
    Constants.arabic: Constants.arabicName,
    Constants.english: Constants.englishName,
  };

  List<Locale> get locales => languages.keys.map((e) => Locale(e)).toList();

  Locale get defaultLocale => Locale(settingsPrefs.getLocale());
}
