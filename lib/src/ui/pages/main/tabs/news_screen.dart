import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/widgets/news_card_widget.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class NewsScreen extends StatelessWidget {
  final _listOfNewsCards = List.generate(
    10,
    (_) => NewsCard(
        imageUrl: AppAssets.newsCardImageBackground,
        title: AppStrings.homeScreenNewsTitle),
  );
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
