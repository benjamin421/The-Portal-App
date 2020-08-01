import 'package:fiber/Models/PortalEpisode.dart';
import 'package:fiber/Models/WPBlog.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_web_auth/flutter_web_auth.dart';

class AuthService {
  static Future<String> getAuth() async {
// Present the dialog to the user
    final result = await FlutterWebAuth.authenticate(
        url: "https://penrose.garden/auth/discord/login?callback=portalauth://success",
        callbackUrlScheme: "portalauth");
    print(result);

// Extract token from resulting url
    final token = Uri.parse(result).queryParameters['authorization'];
    print(token);
    return token;
  }
}
