import 'package:intl/intl.dart';

class UtilsService {
  // R$
  String formatterNumber(price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }
}
