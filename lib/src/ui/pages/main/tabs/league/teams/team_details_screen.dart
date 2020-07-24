import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/models/team.dart';
import 'package:intl/intl.dart';
import 'package:league_app/src/util/date_time_util.dart';

class TeamDetailScreen extends StatelessWidget {
  final Team team;

  TeamDetailScreen({Key key, @required this.team}) : super(key: key);

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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                team.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard() {
    DateTime foundedOnDate = team.foundedOn;
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
                title: AppStrings.fullName, detail: team.name),
            Divider(color: Colors.white),
            _buildOverviewInformation(
                title: AppStrings.nickname, detail: team.alias),
            Divider(color: Colors.white),
            _buildOverviewInformation(
              title: AppStrings.foundedOn,
              detail: DateTimeUtil().getDateString(foundedOnDate),
            )
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
          team.name,
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
