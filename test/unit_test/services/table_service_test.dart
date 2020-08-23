import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/table.dart';
import 'package:league_app/src/services/table_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('TableService', () {
    test(
        '.getTableStandingList returns a List of Standing objects when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.tableEndPoint;
      String successResponseBody = """{
   "api":{
      "results":1,
      "standings":[
         [
            {
               "rank":20,
               "team_id":37,
               "teamName":"Huddersfield",
               "logo":"https://media.api-sports.io/football/teams/37.png",
               "group":"Premier League",
               "forme":"DDLLL",
               "status":"",
               "description":"Relegation - Championship",
               "all":{
                  "matchsPlayed":38,
                  "win":3,
                  "draw":7,
                  "lose":28,
                  "goalsFor":22,
                  "goalsAgainst":76
               },
               "home":{
                  "matchsPlayed":19,
                  "win":2,
                  "draw":3,
                  "lose":14,
                  "goalsFor":10,
                  "goalsAgainst":31
               },
               "away":{
                  "matchsPlayed":19,
                  "win":1,
                  "draw":4,
                  "lose":14,
                  "goalsFor":12,
                  "goalsAgainst":45
               },
               "goalsDiff":-54,
               "points":16,
               "lastUpdate":"2019-05-12"
            }
         ]
      ]
   }
} """;
      Response successResponse = Response(successResponseBody, 200);
      when(mockClient.get(url))
          .thenAnswer((_) async => Future.value(successResponse));
      TableService tableService = TableService(mockClient);
      expect(await tableService.getTableStandingList(), isA<List<Standing>>());
    });

    test(
        '.getTableStandingList throws an error when the request does not complete successfully',
        () {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.tableEndPoint;

      Response failureResponse = Response('', 400);

      when(mockClient.get(url))
          .thenAnswer((_) => Future.value(failureResponse));

      TableService tableService = TableService(mockClient);

      expect(tableService.getTableStandingList(), throwsException);
    });
  });
}
