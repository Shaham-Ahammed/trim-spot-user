import 'package:intl/intl.dart';

String getTimeAgo(String reviewDate) {
  DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(reviewDate);
  DateTime currenttime = DateTime.now();

   Duration difference = currenttime.difference(dateTime);

  if (difference.inDays > 365) {
    int years = (difference.inDays / 365).floor();
    return '$years year${years != 1 ? 's' : ''} ago';
  } else if (difference.inDays > 30) {
    int months = (difference.inDays / 30).floor();
    return '$months month${months != 1 ? 's' : ''} ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} day${difference.inDays != 1 ? 's' : ''} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hour${difference.inHours != 1 ? 's' : ''} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minute${difference.inMinutes != 1 ? 's' : ''} ago';
  } else {
    return 'Just now';
  }
}
