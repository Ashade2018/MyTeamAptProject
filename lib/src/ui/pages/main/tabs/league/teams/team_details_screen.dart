import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';

class TeamDetailScreen extends StatelessWidget {
  Widget _buildDescriptionCard() {
    return Card(
      color: AppColors.backgroundColorElevated16,
      margin: EdgeInsets.symmetric(horizontal: 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.description,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              AppStrings.loremIpsum,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard() {
    return Card(
      color: AppColors.backgroundColorElevated16,
      margin: EdgeInsets.symmetric(horizontal: 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.overview,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 16.0),
            Divider(color: Colors.white),
            _buildOverviewInformation(
                title: AppStrings.fullName,
                detail: AppStrings.liverpool + AppStrings.foootballClub),
            Divider(color: Colors.white),
            _buildOverviewInformation(
                title: AppStrings.nickname,
                detail: AppStrings.liverpoolNickname),
            Divider(color: Colors.white),
            _buildOverviewInformation(
                title: AppStrings.foundedOn,
                detail: AppStrings.liverpoolFoundedDate)
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewInformation(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.liverpool,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: <Widget>[
              _buildOverviewCard(),
              SizedBox(height: 24.0),
              _buildDescriptionCard(),
            ],
          ),
        ),
      ),
    );
  }
}
