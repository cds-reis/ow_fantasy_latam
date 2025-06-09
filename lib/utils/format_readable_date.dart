import 'package:intl/intl.dart';

String formatReadableDate(DateTime date) {
  final formatter = DateFormat('EEE, dd/MM HH:mm');
  return formatter.format(date.toLocal());
}
