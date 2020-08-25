import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/player.dart';
import 'package:league_app/src/services/players_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('PlayersService', () {
    test(
        '.getplayer returns a List of Player objects when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.playersEndPoint;
      String successResponseBody = """[
   {
      "player":{
         "id":17,
         "name":"C. Pulisic",
         "firstname":"Christian",
         "lastname":"Pulisic",
         "age":22,
         "birth":{
            "date":"1998-09-18",
            "place":"Hershey",
            "country":"USA"
         },
         "nationality":"USA",
         "height":"172 cm",
         "weight":"69 kg",
         "injured":false,
         "photo":"https://media.api-sports.io/football/players/17.png"
      },
      "statistics":[
         {
            "team":{
               "id":49,
               "name":"Chelsea",
               "logo":"https://media.api-sports.io/football/teams/49.png"
            },
            "league":{
               "id":39,
               "name":"Premier League",
               "country":"England",
               "logo":"https://media.api-sports.io/football/leagues/39.png",
               "flag":"https://media.api-sports.io/flags/gb.svg",
               "season":2019
            },
            "games":{
               "appearences":25,
               "lineups":19,
               "minutes":1727,
               "number":null,
               "position":"Midfielder",
               "rating":"6.916000",
               "captain":false
            },
            "substitutes":{
               "in":6,
               "out":11,
               "bench":10
            },
            "shots":{
               "total":63,
               "on":26
            },
            "goals":{
               "total":9,
               "conceded":null,
               "assists":4,
               "saves":null
            },
            "passes":{
               "total":534,
               "key":31,
               "accuracy":79
            },
            "tackles":{
               "total":23,
               "blocks":0,
               "interceptions":6
            },
            "duels":{
               "total":318,
               "won":128
            },
            "dribbles":{
               "attempts":108,
               "success":55,
               "past":null
            },
            "fouls":{
               "drawn":30,
               "committed":14
            },
            "cards":{
               "yellow":0,
               "yellowred":0,
               "red":0
            },
            "penalty":{
               "won":2,
               "commited":null,
               "scored":0,
               "missed":0,
               "saved":null
            }
         }
      ]
   }
]""";
      Response successResponse = Response(successResponseBody, 200);
      when(mockClient.get(url))
          .thenAnswer((_) async => Future.value(successResponse));
      PlayersService playersService = PlayersService(mockClient);
      expect(await playersService.getPlayer(), isA<List<Player>>());
    });
    test(
        '.getPlayer throws an error when the request does not complete successfully',
        () {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.playersEndPoint;

      Response failureResponse = Response('', 400);

      when(mockClient.get(url))
          .thenAnswer((_) => Future.value(failureResponse));

      PlayersService playersService = PlayersService(mockClient);

      expect(playersService.getPlayer(), throwsException);
    });
  });
}
