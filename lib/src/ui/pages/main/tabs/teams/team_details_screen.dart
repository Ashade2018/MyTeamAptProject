import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';

class TeamDetailScreen extends StatelessWidget {
  Widget _displayDescriptionSection() {
    return Container(
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
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
              height: 8.0,
            ),
            Text(
              AppStrings.descriptionLatinText,
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

  Widget _buildOverviewInformation(String titleText, String trailingText) {
    return Column(children: <Widget>[
      Divider(color: Colors.white),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              titleText,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              trailingText,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    ]);
  }

  Widget _displayOverviewSection() {
    return Container(
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                AppStrings.overview,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            _buildOverviewInformation(AppStrings.fullName,
                AppStrings.liverpool + AppStrings.foootballClub),
            _buildOverviewInformation(
                AppStrings.nickname, AppStrings.liverpoolNickname),
            _buildOverviewInformation(
                AppStrings.foundedOn, AppStrings.liverpoolFoundedDate)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
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
              _displayOverviewSection(),
              SizedBox(
                height: 25.0,
              ),
              _displayDescriptionSection(),
            ],
          ),
        ),
      ),
    );
  }
}
