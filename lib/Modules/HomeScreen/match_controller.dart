import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:premier_league/Api/match_api.dart';
import '../../Models/match_model.dart';
import '../../Utilities/shared_preferances_helper.dart';

class MatchController extends ControllerMVC {
  /// singleton
  factory MatchController() {
    _this ??= MatchController._();
    return _this!;
  }

  static MatchController? _this;

  MatchController._();

  bool loading = false;

  List<MatchModel> matches = [];

  /// function to get matches from api
  getMatches() async {
    if (matches.isEmpty) setState(() => loading = true);
    matches = await MatchApi.getMatchesApi();
    if (matches.isEmpty) matches = await SharedPref.getMatchesObg();
    setState(() => loading = false);
  }

  /// function to check is The Same date
  bool isTheSameDay({required DateTime dateTime, required int index}) {
    if (index == matches.length - 1) return true;
    final DateTime date = returnDateWithoutTimeFormat(date: matches[index].utcDate!);
    final DateTime prevDate = returnDateWithoutTimeFormat(date: matches[index + 1].utcDate!);

    return prevDate.isAtSameMomentAs(date) ? false : true;
  }

  /// function to convert date without time
  static DateTime returnDateWithoutTimeFormat({required DateTime date}) {
    return DateTime(date.year, date.month, date.day);
  }
}
