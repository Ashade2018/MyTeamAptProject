import 'dart:convert';

import 'package:http/http.dart';
import 'package:league_app/src/data/app_endpoints.dart';

class SignUpService {
  final Client _client;

  SignUpService(this._client);

  Future<bool> signUp() async {
    try {
      String url = AppEndpoints.signUpEndpoint;
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
