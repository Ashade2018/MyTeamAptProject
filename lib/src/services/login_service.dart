import 'dart:convert';

import 'package:http/http.dart';
import 'package:league_app/src/data/app_endpoints.dart';

class LoginService {
  final Client _client;

  LoginService(this._client);

  Future<bool> login() async {
    try {
      String url = AppEndpoints.loginEndpoint;
      Response response = await _client.get(url);

      if (response.statusCode == 200) {
        String body = response.body;
        Map<String, dynamic> decodedBody = jsonDecode(body);

        if (decodedBody['success'] == true) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
