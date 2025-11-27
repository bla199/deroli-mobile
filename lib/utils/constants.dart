/*
This class stores contant variable for the app
*/

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class Constants {
  // backend url
  static const String apiUrl = 'http://192.168.1.14:8000/';

  // current app version
  static const String currentVersion = "1.0.1";

  static final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter.currency(decimalDigits: 0, symbol: 'Tsh ');

  static final CurrencyTextInputFormatter formatterNone =
      CurrencyTextInputFormatter.currency(decimalDigits: 0, symbol: '');

  // format number with a comma and TZS
  static String commaValueWithTZS(double number) {
    var ss = number.toStringAsFixed(0);
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    ss = ss.replaceAllMapped(reg, (Match match) => '${match[1]},');
    return "$ss TZS";
  }

  // format a number with a comma
  static String commaValue(double number) {
    var ss = number.toStringAsFixed(0);
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    ss = ss.replaceAllMapped(reg, (Match match) => '${match[1]},');
    return ss;
  }
}
