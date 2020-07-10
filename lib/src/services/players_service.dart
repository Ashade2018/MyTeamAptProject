import 'dart:convert';
import 'package:http/http.dart';
import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/player.dart';

class PlayersService {
  final Client _client;

  PlayersService(this._client);

  Future<List<Player>> getPlayer() async {
    try {
      String url = AppEndpoints.playersEndPoint;
      Response response = await _client.get(url);

      if (response.statusCode == 200) {
        String body = response.body;
        List<dynamic> decodedBody = jsonDecode(body);
        List<Player> playerList =
            decodedBody.map((player) => Player.fromMap(player as Map)).toList();
        return playerList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
