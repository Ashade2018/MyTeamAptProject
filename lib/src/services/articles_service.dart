import 'dart:convert';
import 'package:http/http.dart';
import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/models/article.dart';

class ArticlesService {
  final Client _client;

  ArticlesService(this._client);

  Future<List<Article>> getArticles() async {
    try {
      String url = AppEndpoints.articlesEndpoint;
      Response response = await _client.get(url);

      if (response.statusCode == 200) {
        String body = response.body;
        List<dynamic> decodedBody = jsonDecode(body);

        List<Article> articleList = decodedBody
            .map((article) => Article.fromMap(article as Map))
            .toList();

        return articleList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
