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
    "name": "Pepe",
    "dateOfBirth": "2000-04-21",
    "nationality": "Nigerian"
  },
  {
    "name": "Lingard",
    "dateOfBirth": "2011-10-15",
    "nationality": "Ghanian"
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
