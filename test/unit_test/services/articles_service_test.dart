import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/article.dart';
import 'package:league_app/src/services/articles_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';
import '../data/test_strings.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('ArticlesService', () {
    test(
        '.getArticles returns a List of Article objects when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.articlesEndpoint;

      final String successResponseBody =
          TestStrings.articleServiceTestSuccessResponseBody;

      Response successResponse = Response(successResponseBody, 200);
      when(mockClient.get(url))
          .thenAnswer((_) async => Future.value(successResponse));

      ArticlesService articlesService = ArticlesService(mockClient);

      expect(await articlesService.getArticles(), isA<List<Article>>());
    });

    test(
        '.getArticles throws an error when the request does not complete successfully',
        () {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.articlesEndpoint;

      Response failureResponse = Response('', 400);

      when(mockClient.get(url))
          .thenAnswer((_) => Future.value(failureResponse));

      ArticlesService articlesService = ArticlesService(mockClient);

      expect(articlesService.getArticles(), throwsException);
    });
  });
}
