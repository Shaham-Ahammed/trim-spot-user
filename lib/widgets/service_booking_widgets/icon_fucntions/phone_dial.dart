import 'package:url_launcher/url_launcher.dart';

launchDialer(String phoneNumber) async {
  final Uri url = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } 
}
