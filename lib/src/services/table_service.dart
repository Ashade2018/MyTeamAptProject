import 'dart:convert';
import 'package:http/http.dart';
import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/table.dart';

class TableService {
  final Client _client;

  TableService(this._client);

  Future<List<Standing>> getTableStandingList() async {
    try {
      String url = AppEndpoints.tableEndPoint;
      Response response = await _client.get(url);

      if (response.statusCode == 200) {
        String body = response.body;
        Map<String, dynamic> decodedBody = jsonDecode(body);

        List<Standing> standingList =
            Table.fromMap(decodedBody).api.standings.first;
        return standingList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
