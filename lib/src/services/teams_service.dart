import 'dart:convert';

import 'package:http/http.dart';
import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/team.dart';

class TeamsService {
  final Client _client;

  TeamsService(this._client);

  Future<List<Team>> getTeams() async {
    try {
      String url = AppEndpoints.teamsEndpoint;

      //TODO Implement get teams

      Response response = await _client.get(url);

      if (response.statusCode == 200) {
        String body = response.body;
        List<dynamic> decodedBody = jsonDecode(body);

        List<Team> teams = decodedBody;
        return teams;
      }
    } catch (e) {
      //TODO throw an error
    }
  }
}
