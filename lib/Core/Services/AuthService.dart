import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../Shared/AppConstants.dart' as env;

class AuthService {
  var authToken;

  settToken(String token) {
    authToken = token;
  }

  static Future<String> getToken() async {
    final result = await FlutterWebAuth.authenticate(
        url:
            "https://penrose.garden/auth/discord/login?callback=portalauth://success",
        callbackUrlScheme: "portalauth");

// Extract token from resulting url
    final token = Uri.parse(result).queryParameters['authorization'];
    print(token);

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print(decodedToken);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('apiToken', token);
    prefs.setString('userId', decodedToken["id"].toString());
    prefs.setString('iat', decodedToken["iat"].toString());
    prefs.setString('expireytime', decodedToken["exp"].toString());

    return token;
  }

  static Future<ValueNotifier<GraphQLClient>> setClient(String token) async {
    // Present the dialog to the user

    final HttpLink httpLink = HttpLink(
      uri: env.uri,
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
      // OR
      // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );

    return client;
  }
}
