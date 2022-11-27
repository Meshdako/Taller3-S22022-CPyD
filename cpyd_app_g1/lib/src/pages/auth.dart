import 'package:cpyd_app_g1/main.dart';
import 'package:cpyd_app_g1/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

/* Autenticación */
class AuthScreen extends StatelessWidget {
  final String url;
  final String token;

  const AuthScreen({super.key, required this.url, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
            initialUrl: url,
            userAgent: "Utem/1.0",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              CookieManager().clearCookies();
            },
            navigationDelegate: (delegate) {
              final Uri responseUri = Uri.parse(delegate.url);
              final String path = responseUri.path;
              final bool ok = path.endsWith('/ + $token + /result');

              if (ok) {
                VoterService.getJwt(token).then((value) => print(value));

                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ok ? const SecondScreen() : const InicioSesion()));
              }

              return NavigationDecision.navigate;
            }));
  }
}

class VoterService {
  static const String _host = "https://api.sebastian.cl";
  static const String _apiTkn = "sebastian.cl";
  static const String _apiKey = "aaa-bbb-ccc-ddd";
  static const String _mime = "application/json";

  /* Swagger Login */
  static Future<bool> login(BuildContext context) async {
    Uri uri = Uri.parse('$_host/vote/v1/auth/login');
    Map<String, String> headers = {
      'accept': _mime,
      'Content-Type': _mime,
      'X-API-TOKEN': _apiTkn,
      'X-API-KEY': _apiKey
    };

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      final String token = result['token'];
      final String redirectUrl = result['redirectUrl'];

      if (!redirectUrl.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthScreen(url: redirectUrl, token: token),
            ));
      }
    }
    return false;
  }

  /* JWT */
  static Future<String> getJwt(String token) async {
    Uri uri = Uri.parse('$_host vote/v1/auth/ $token /jwt');
    Map<String, String> headers = {
      'accept': _mime,
      'Content-Type': _mime,
      'X-API-TOKEN': _apiTkn,
      'X-API-KEY': _apiKey
    };

    String jwt = "";
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      jwt = result['jwt'];
    }
    return jwt;
  }
}
