import 'package:trim_spot_user_side/widgets/service_booking_widgets/functions/total_time.dart';

String slotsRequired(context) {
  int totalTime = int.parse(totalTimeRequired(context));
  int slotsRequired = (totalTime / 30).ceil();

  return slotsRequired.toString();
}
