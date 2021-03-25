import 'package:intl/intl.dart';

class Currency {
  final String countryCode;
  final int decimalPoint;
  final String? symbol;

  const Currency(this.countryCode, this.decimalPoint, {this.symbol});
}

final NumberFormat standardCurrencySetting = NumberFormat('\Rp ###,###.##');

final NumberFormat standardCurrencyNoSymbolSetting = NumberFormat('###,###.##');

extension NumExt on num {
  String formatMoney({NumberFormat? numberFormat}) {
    final formatter = numberFormat ?? standardCurrencySetting;
    return formatter.format(this);
  }
}

extension StringExt on String {
  num parseMoney({NumberFormat? format}) {
    final selectedFormat = format ?? standardCurrencySetting;
    return selectedFormat.parse(this);
  }
}
