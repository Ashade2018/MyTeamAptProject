import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/team.dart';
import 'package:league_app/src/services/teams_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';
import '../data/test_strings.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('TeamsService', () {
    test(
        '.getTeams returns a List of Team objects when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.teamsEndpoint;

      final String successResponseBody =
          TestStrings.teamsServiceTestSuccessResponseBody;

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
