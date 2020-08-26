import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/table.dart';
import 'package:league_app/src/services/table_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';
import '../data/test_strings.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('TableService', () {
    test(
        '.getTableStandingList returns a List of Standing objects when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.tableEndPoint;
      final String successResponseBody =
          TestStrings.tableServiceTestSuccessResponseBody;
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
