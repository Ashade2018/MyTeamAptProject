import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/models/article.dart';
import 'package:league_app/src/services/articles_service.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/news/news_details_screen.dart';
import 'package:league_app/src/ui/widgets/news_card.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/news_screen.dart';
import 'package:league_app/src/ui/widgets/news_card_widget.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class LatestTab extends StatefulWidget {
  @override
  _LatestTabState createState() => _LatestTabState();
}

class _LatestTabState extends State<LatestTab> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final int _numberOfArticlesToDisplay = 3;

  bool _isLoadingArticles = false;

  List<Article> _articleList = [];

  void _navigateToNewsDetailsScreen({@required Article article}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NewsDetailsScreen(
                  article: article,
                )));
  }

  void _navigateToNewsScreen({@required List<Article> articleList}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NewsScreen(
                  articleList: articleList,
                )));
  }

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() async {
    setState(() {
      _isLoadingArticles = true;
    });
    try {
      Client client = Client();
      ArticlesService articlesService = ArticlesService(client);
      _articleList = await articlesService.getArticles();

      _articleList.sort((a, b) {
        return a.publishedDate.compareTo(b.publishedDate);
      });

      setState(() {
        _isLoadingArticles = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingArticles = false;
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

  final List<Map<String, dynamic>> _tableTeamList = [
    {
      'position': 1,
      'club': 'Liverpool',
      'imageAsset': AppAssets.liverpoolClubIconImage,
      'played': 82,
      'goalDifference': 82,
      'points': 82
    },
    {
      'position': 2,
      'club': 'Man City',
      'imageAsset': AppAssets.manCityClubIconImage,
      'played': 57,
      'goalDifference': 57,
      'points': 57
    },
    {
      'position': 3,
      'club': 'Leicester',
      'imageAsset': AppAssets.leicesterClubIconImage,
      'played': 53,
      'goalDifference': 53,
      'points': 53
    },
    {
      'position': 4,
      'club': 'Chelsea',
      'imageAsset': AppAssets.chelseaClubIconImage,
      'played': 48,
      'goalDifference': 48,
      'points': 48
    },
    {
      'position': 5,
      'club': 'Man Utd',
      'imageAsset': AppAssets.manUtdClubIconImage,
      'played': 45,
      'goalDifference': 45,
      'points': 45
    },
  ];

  @override
  Widget build(BuildContext context) {
    return TabBackgroundWrapper(
      title: AppStrings.latest,
      body: Column(
        children: <Widget>[
          _buildNewsSection(),
          _isLoadingArticles || _articleList.isNotEmpty
              ? SizedBox(
                  height: 24.0,
                )
              : SizedBox.shrink(),
          _buildLeagueTableContainer(context),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _buildNewsSection() {
    return Column(
      children: <Widget>[
        _articleList.isNotEmpty
            ? _buildNewsTopRow(articleList: _articleList)
            : SizedBox.shrink(),
        Stack(
          children: <Widget>[
            _isLoadingArticles
                ? Center(
                    child: _buildLoadingIndicator(),
                  )
                : Column(
                    children: <Widget>[
                      ..._articleList
                          .take(_numberOfArticlesToDisplay)
                          .map(
                            (article) => NewsCard(
                              imageUrl: article.image,
                              title: article.title,
                              onTap: () => _navigateToNewsDetailsScreen(
                                  article: article),
                            ),
                          )
                          .toList()
                    ],
                  ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );

  Widget _buildNewsTopRow({@required List<Article> articleList}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          AppStrings.latestNews,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        FlatButton(
          onPressed: () => _navigateToNewsScreen(articleList: articleList),
          textColor: AppColors.accentColor,
          child: Text(
            AppStrings.showAll,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLeagueTableContainer(BuildContext context) {
    return Card(
        color: AppColors.backgroundColorElevated16,
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
          child: Column(
            children: <Widget>[
              _buildTableTitle(),
              SizedBox(height: 16.0),
              _buildTableTopBar(),
              ..._tableTeamList.map(
                (team) => _buildLeagueTableItem(
                    imageAsset: team['imageAsset'],
                    played: team['played'],
                    goalDifference: team['goalDifference'],
                    points: team['points'],
                    clubName: team['club'],
                    position: team['position']),
              ),
              _buildFullTableButton()
            ],
          ),
        ));
  }

  Widget _buildTableTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppStrings.leagueTableTitle,
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildTableTopBar() {
    return Container(
      color: AppColors.backgroundColorElevated24,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  'Pos',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Expanded(child: SizedBox.shrink()),
            Expanded(
              flex: 5,
              child: Text(
                'Club',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: Text(
                'P',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: Text(
                'GD',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: Text(
                'Pts',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullTableButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                AppStrings.fullTable,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 4.0,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 14.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeagueTableItem(
      {@required int position,
      @required String imageAsset,
      @required String clubName,
      @required int played,
      @required int goalDifference,
      @required int points}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    position.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                child: CircleAvatar(
                  radius: 2.0,
                  backgroundColor: AppColors.backgroundColorElevated24,
                ),
              )),
              Expanded(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: Image.asset(imageAsset)),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      clubName,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  played.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  goalDifference.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  points.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.backgroundColorElevated24,
          thickness: 1.0,
          height: 0.0,
        )
      ],
    );
  }
}
