import 'package:trim_spot_user_side/utils/service_booking/total_time.dart';

String slotsRequired(context) {
  int totalTime = int.parse(totalTimeRequired(context));
  int slotsRequired = (totalTime ~/ 30).ceil();
  return slotsRequired.toString();
}
