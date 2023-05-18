import 'package:intl/intl.dart';
import 'package:premier_league/Utilities/shared_preferances_helper.dart';


class DateHelper {
  static final formatterCustomDMY =
      DateFormat('d MMM, yyyy', SharedPref.getCurrentLang() ?? 'en');
  static final formatterCustomTime =
      DateFormat('hh:mm a', SharedPref.getCurrentLang() ?? 'en');
  static final formatterCustomDay =
      DateFormat('EEEE', SharedPref.getCurrentLang() ?? 'en');

  /// function to get date name or date format BY date
  static getDateName({required DateTime dateTime}) {
    final todayDate = DateTime.now();
    if (formatterCustomDMY.format(dateTime) ==
        formatterCustomDMY.format(todayDate)) {
      return 'today';
    } else if (formatterCustomDMY.format(dateTime) ==
        formatterCustomDMY.format(
            DateTime(todayDate.year, todayDate.month, todayDate.day - 1))) {
      return 'yesterday';
    } else if (formatterCustomDMY.format(dateTime) ==
        formatterCustomDMY.format(
            DateTime(todayDate.year, todayDate.month, todayDate.day + 1))) {
      return 'tomorrow';
    } else
      return formatterCustomDMY.format(dateTime).toString();
  }


}
