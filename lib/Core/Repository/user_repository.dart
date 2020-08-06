import 'package:fiber/Core/Helpers/preferences_utils.dart';
import 'package:fiber/Core/Helpers/tokens.dart';
import 'package:fiber/Models/access_data.dart';
import 'package:fiber/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fiber/Models/User.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepository {
  Tokens _tokens = Tokens.instance;

  Future<bool> deleteToken() async {
    return await PreferenceUtils.remove("Data");
  }

  Future<bool> hasToken() async {
    if (await PreferenceUtils.containsKey("accessData")) {
      _tokens.accessData =
          AccessData.fromJson(PreferenceUtils.getString("accessData"));
      if (_tokens.accessData.penroseToken != null) {
        print("Token found");
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future<User> getUserProfile() async {}

  Future<Map> login() async {
    try {
      final result = await FlutterWebAuth.authenticate(
          url:
              "https://penrose.garden/auth/discord/login?callback=portalauth://success",
          callbackUrlScheme: "portalauth");

// Extract token from resulting url
      final token = Uri.parse(result).queryParameters['authorization'];
      print(token);

      Map<String, dynamic> decodedTokenData = JwtDecoder.decode(token);
      print(decodedTokenData);

      Map<String, dynamic> accessData = {
        "penroseToken": token,
        "decodedData": decodedTokenData
      };

      PreferenceUtils.setString("accessData", _tokens.accessData.toJson());
      // await updateDeviceToken(_tokens.accessData.userLogin.orgId);
      User user = await getUserProfile();
      return accessData;
    } catch (e) {
      print("Error user login: $e");
      return null;
    }
  }
}
