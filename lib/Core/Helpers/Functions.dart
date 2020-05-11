import 'package:url_launcher/url_launcher.dart';

class Functions {
  static launchURL(String redirect) async {
    final url = redirect;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
