import 'package:flutter/material.dart';
import 'package:premier_league/locale/locales.dart';

/// extension check mounted
extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

/// ignore: camel_case_extensions
/// extension function that is add translate function to string
extension translate on String {
  String get tr => AppLocalizations.instance.translate(this) ?? "";
}
