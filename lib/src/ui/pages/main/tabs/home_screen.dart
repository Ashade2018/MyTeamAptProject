import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/widgets/news_card_widget.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class HomeScreen extends StatelessWidget {
  final _listOfNewsCards = List.generate(
    3,
    (_) => NewsCard(
        imageUrl: AppAssets.newsCardImageBackground,
        title: AppStrings.homeScreenNewsTitle),
  );

  @override
  Widget build(BuildContext context) {
    return TabBackgroundWrapper(
        title: AppStrings.appTitle,
        body: Column(children: <Widget>[
          _buildNewsTopRow(),
          ..._listOfNewsCards,
          _buildLeagueTableContainer(context)
        ]));
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

  Widget _buildLeagueTableContainer(BuildContext context) {
    return Card(
        color: AppColors.backgroundColorElevated12,
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.leagueTableTitle,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Placeholder(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Placeholder(),
                  ),
                  Expanded(
                    child: Placeholder(),
                  ),
                  Expanded(
                    child: Placeholder(),
                  ),
                  Expanded(
                    child: Placeholder(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
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
                      size: 16.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
