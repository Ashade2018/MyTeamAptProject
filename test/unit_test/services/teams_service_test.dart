import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/team.dart';
import 'package:league_app/src/services/teams_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('TeamsService', () {
    test(
        '.getTeams returns a List of Team objects when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.teamsEndpoint;

      String successResponseBody = """
      [
  {
    "code": "NIG",
    "name": "Nigeria",
    "alias": "The Super Eagles",
    "description": "The Nigerian national football team",
    "hexColor": "#ffffff",
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/400px-Flag_of_Nigeria.svg.png",
    "foundedOn": "1933-08-21"
  },
  {
    "code": "ARG",
    "name": "Argentina",
    "alias": "La Albiceleste",
    "description": "The Argentine national football team",
    "hexColor": "#ffffff",
    "imageUrl": "https://upload.wikimedia.org/wikipedia/en/8/84/Afa_logo_jerseys.png",
    "foundedOn": "1867-05-09"
  },
  {
    "code": "BRA",
    "name": "Brazil",
    "alias": "Seleção",
    "description": "The Brazil national team",
    "hexColor": "#ffffff",
    "imageUrl": "https://upload.wikimedia.org/wikipedia/en/thumb/9/99/Brazilian_Football_Confederation_logo.svg/340px-Brazilian_Football_Confederation_logo.svg.png",
    "foundedOn": "1914-06-08"
  }
]
      """;

      Response successResponse = Response(successResponseBody, 200);
      when(mockClient.get(url))
          .thenAnswer((_) async => Future.value(successResponse));

      TeamsService teamsService = TeamsService(mockClient);

      expect(await teamsService.getTeams(), isA<List<Team>>());
    });

    test(
        '.getTeams throws an error when the request does not complete successfully',
        () {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.teamsEndpoint;

      Response failureResponse = Response('', 400);

      when(mockClient.get(url))
          .thenAnswer((_) => Future.value(failureResponse));

      TeamsService teamsService = TeamsService(mockClient);

      expect(teamsService.getTeams(), throwsException);
    });
  });
}
