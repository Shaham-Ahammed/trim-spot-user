import 'package:url_launcher/url_launcher.dart';

sendMessage(String phoneNumber) async {
  final Uri uri = Uri(scheme: 'sms', path: phoneNumber);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
