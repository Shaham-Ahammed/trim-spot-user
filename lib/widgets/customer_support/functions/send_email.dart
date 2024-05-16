import 'package:url_launcher/url_launcher.dart';

sendEmail() async {
  final Uri uri = Uri(scheme: 'mailto', path: 'shahamahammed66@gmail.com');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
