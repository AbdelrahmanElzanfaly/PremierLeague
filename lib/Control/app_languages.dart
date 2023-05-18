import 'dart:developer';

import 'package:flutter/material.dart';

import '../Utilities/shared_preferances_helper.dart';

enum Languages {en,ar}

class AppLanguage extends ChangeNotifier {
  Languages _appLanguage = Languages.en;

  Languages get appLang => _appLanguage;

  fetchLocale() async {
    if (SharedPref.getCurrentLang() == null) return null;
    _appLanguage = Languages.values.firstWhere((lang) => lang.name == SharedPref.getCurrentLang());
    return null;
  }

  Future<void> changeLanguage({Languages? language}) async {
    log(language?.name??"");
    if (_appLanguage == language) return;

    _appLanguage = language!;
    await SharedPref.setCurrentLang(lang: language.name);
    notifyListeners();
  }
}
