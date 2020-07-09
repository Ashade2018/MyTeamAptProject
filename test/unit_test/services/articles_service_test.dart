import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/article.dart';
import 'package:league_app/src/services/articles_service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('ArticlesService', () {
    test(
        '.getArticles returns a List of Article objects when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.articlesEndpoint;

      String successResponseBody = """
    [
  {
    "slug": "aa",
    "section": "transfers",
    "title": "Manchester United transfer dilemma shows how quickly priorities can change",
    "creationDate": "2020-06-22",
    "body": "When Ole Gunnar Solskjaer played down his post-match chat with Bournemouth defender Nathan Ake he focused on quantity when it comes to his options at the back.The United boss was caught in discussion with Ake after the 5-2 win at Old Trafford on Saturday and it was reported he told the Dutchman: We need a left-footed centre-back, so keep going.But while that had led to days of speculation that United could be considering a move for Ake, who is expected to leave Bournemouth this summer, Solskjaer played it down during his press conference on Wednesday I've got seven centre-backs, I don't know where that's come from. We're fine, the United boss said. You could arguably make that eight centre-backs with teenager Teden Mengi training with the first-team since the season restarted, but the issue for United is less one of quantity, and more an issue of quality.",
    "image": "https://i2-prod.manchestereveningnews.co.uk/incoming/article18561953.ece/ALTERNATES/s810/0_GettyImages-1254867027.jpg",
    "author": "Tyrone Marshall",
    "location": "Lagos, Nigeria",
    "wordCount": 15,
    "about": "Ole Gunnar Solskjaer has played down the need for Man Utd to sign a central defender but it's something he might still have to consider.",
    "status": "draft",
    "publishedDate": "2020-06-22",
    "contributors": [
      "Samuel Luckhurst",
      "Richard Fay"
    ]
  },
  {
    "slug": "cc",
    "section": "transfers",
    "title": "Manchester United transfer dilemma shows how quickly priorities can change",
    "creationDate": "2020-06-22",
    "body": "When Ole Gunnar Solskjaer played down his post-match chat with Bournemouth defender Nathan Ake he focused on quantity when it comes to his options at the back. The United boss was caught in discussion with Ake after the 5-2 win at Old Trafford on Saturday and it was reported he told the Dutchman: We need a left-footed centre-back, so keep going. But while that had led to days of speculation that United could be considering a move for Ake, who is expected to leave Bournemouth this summer, Solskjaer played it down during his press conference on Wednesday I've got seven centre-backs, I don't know where that's come from. We're fine, the United boss said. You could arguably make that eight centre-backs with teenager Teden Mengi training with the first-team since the season restarted, but the issue for United is less one of quantity, and more an issue of quality.",
    "image": "https://i2-prod.manchestereveningnews.co.uk/incoming/article18561953.ece/ALTERNATES/s810/0_GettyImages-1254867027.jpg",
    "author": "Tyrone Marshall",
    "location": "Lagos, Nigeria",
    "wordCount": 15,
    "about": "Ole Gunnar Solskjaer has played down the need for Man Utd to sign a central defender but it's something he might still have to consider.",
    "status": "draft",
    "publishedDate": "2020-06-22",
    "contributors": []
  }
]
      """;

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
