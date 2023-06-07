import 'package:url_launcher/url_launcher.dart';

openBrowser({required String urlArt}) async {
  final Uri url = Uri.parse(urlArt);
  await launchUrl(url);
}
