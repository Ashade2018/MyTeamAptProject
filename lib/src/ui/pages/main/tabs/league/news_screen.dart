import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/models/article.dart';
import 'package:league_app/src/services/articles_service.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/news/news_details_screen.dart';
import 'package:league_app/src/ui/widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  final List<Article> articleList;

  const NewsScreen({Key key, this.articleList}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  List<Article> _articleList = [];

  void _navigateToNewsDetailsScreen(BuildContext context,
      {@required Article article}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(article: article)));
  }

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() async {
    if (widget.articleList != null) {
      _articleList = widget.articleList;
      return;
    }

    setState(() {
      _isLoading = true;
    });
    try {
      Client client = Client();
      ArticlesService articlesService = ArticlesService(client);
      _articleList = await articlesService.getArticles();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      final SnackBar snackBar = SnackBar(
          content: Text(
            'Could not get news articles.',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white);
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.news,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.backgroundColorElevated16,
      ),
      body: Stack(
        children: <Widget>[
          _isLoading
              ? Center(
                  child: _buildLoadingIndicator(),
                )
              : _articleList.isEmpty
                  ? Center(
                      child: Text('No news available',
                          style: TextStyle(color: Colors.white)),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 0.0),
                      itemCount: _articleList.length,
                      itemBuilder: (context, index) {
                        return _buildArticleListTile(context, index: index);
                      }),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );

  Widget _buildArticleListTile(BuildContext context, {@required int index}) {
    Article article = _articleList[index];
    return NewsCard(
      imageUrl: article.image,
      title: article.title,
      onTap: () => _navigateToNewsDetailsScreen(context, article: article),
    );
  }
}
