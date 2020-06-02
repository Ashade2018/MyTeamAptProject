import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/main/tabs/news/news_details_screen.dart';
import 'package:league_app/src/ui/widgets/news_card_widget.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsCard> _listOfNewsCards;
  
  void _navigateToNewsDetailsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NewsDetailsScreen()));
  }

  @override
  void initState() {
    super.initState();
    _listOfNewsCards = List.generate(
      3,
      (_) => NewsCard(
        imageUrl: AppAssets.newsCardImageBackground,
        title: AppStrings.homeScreenNewsTitle,
        onTap: _navigateToNewsDetailsScreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TabBackgroundWrapper(
      title: AppStrings.appTitle,
      body: Column(
        children: <Widget>[
          _buildNewsTopRow(),
          ..._listOfNewsCards,
        ],
      ),
    );
  }

  Widget _buildNewsTopRow() {
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
          onPressed: () {},
          child: Text(
            AppStrings.showAll,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.accentColor,
            ),
          ),
        )
      ],
    );
  }
}
