import 'dart:convert';

import 'package:http/http.dart';
import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/team.dart';


class TeamsService {
  final Client _client;

  TeamsService(this._client);

  Future<List<Team>> getTeams() {
    try {
      String url = AppEndpoints.teamsEndpoint;

      //TODO Implement get teams
    } catch (e) {
      //TODO throw an error
    }
  }


}