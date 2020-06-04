import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/news/news_details_screen.dart';
import 'package:league_app/src/ui/widgets/news_card_widget.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
      10,
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
      title: AppStrings.news,
      body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: _listOfNewsCards,
      ),
    );
  }
}
