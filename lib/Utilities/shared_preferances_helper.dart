import 'dart:convert';

import 'package:premier_league/Models/match_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  /// singleton
  factory SharedPref() {
    _this ??= SharedPref._();
    return _this!;
  }

  static SharedPref? _this;

  SharedPref._();

  static SharedPreferences? prefs;

  static const String _language = "language_code";
  static const String _matchObj = "matchObj";

  /// initial Instance of shared pref
  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// get Current Language from SharedPref
  static String? getCurrentLang() {
    return prefs?.getString(_language);
  }

  /// save Current Language to SharedPref
  static Future<void> setCurrentLang({required String lang}) async {
    await prefs?.setString(_language, lang);
  }

  /// save MatchesObj to SharedPref
  static Future<bool?> saveMatchesObj(
      {required List<MatchModel> matchModel}) async {
    return await prefs?.setString(_matchObj, MatchModel.encode(matchModel));
  }

  /// get Matches from SharedPref
  static List<MatchModel> getMatchesObg() {
    String? matchStringData = prefs?.getString(_matchObj);
    if (matchStringData == null) return [];
    return MatchModel.decode(matchStringData);
  }
}
