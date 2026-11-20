import 'package:intl/intl.dart';

class CurrencyHelper {
  static String formatRupiah(num? amount) {
    final value = amount ?? 0;
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }
}