import 'package:intl/intl.dart';

String timeNowFormat() {
  var now = DateTime.now();
  var formatter = DateFormat.yMd().add_Hm();
  String time = formatter.format(now);
  return time;
}
