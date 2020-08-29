import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';

class SeasonDetailsScreen extends StatelessWidget {
  final String seasonName;

  const SeasonDetailsScreen({Key key, @required this.seasonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          seasonName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildSeasonDetailsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSeasonDetails(
      {@required String title, @required String detail}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w100),
          ),
          Text(
            detail,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSeasonDetailsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Card(
        color: AppColors.backgroundColorElevated16,
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.seasonDetails,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 16.0),
              Divider(color: Colors.white),
              _buildSeasonDetails(
                title: AppStrings.startDate,
                detail: AppStrings.seasonDetailsDate,
              ),
              Divider(color: Colors.white),
              _buildSeasonDetails(
                title: AppStrings.endDate,
                detail: AppStrings.seasonDetailsDate,
              ),
              Divider(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
