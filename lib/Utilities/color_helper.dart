import 'package:flutter/material.dart';

class ColorHelper {
  /// function to get color text BY status
  static Color getColorText({required String status}) {
    switch (status) {
      case 'FINISHED':
        return Color(0xffC79CA6);
      case 'CANCELED':
        return Color(0xff825B64);
      case 'IN_PLAY':
        return Color(0xffD60133);
      case 'SCHEDULED':
        return Color(0xffBD687C);
      case 'NOT_START':
        return Color(0xfc4d32cb);
      default:
        return Colors.amber;
    }
  }














/// function to get color text BY status
// static Color getColorText({required Status status}) {
//   switch (status) {
//     case Status.FINISHED:
//       return Color(0xffC79CA6);
//     case Status.CANCELED:
//       return Color(0xff825B64);
//     case Status.LIVE_NOW:
//       return Color(0xffD60133);
//     case Status.SCHEDULED:
//       return Color(0xffBD687C);
//     case Status.NOT_START:
//       return Color(0xfc4d32cb);
//     default:
//       return Colors.amber;
//   }
// }
}