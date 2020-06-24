import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';

class FixturesScreen extends StatelessWidget {
  final List<Map<String, String>> _unconfirmedMatchesMockList = List.generate(
    5,
    (index) => {
      'homeTeam': 'Leicester',
      'awayTeam': 'Man City',
      'homeTeamLogoAsset': AppAssets.leicesterLogo,
      'awayTeamLogoAsset': AppAssets.manCityLogo,
      'matchTime': 'TBC',
    },
  );

  final List<Map<String, String>> _confirmedMatchesMockList = List.generate(
    5,
    (index) => {
      'homeTeam': 'Leicester',
      'awayTeam': 'Man City',
      'homeTeamLogoAsset': AppAssets.leicesterLogo,
      'awayTeamLogoAsset': AppAssets.manCityLogo,
      'matchTime': '12:30',
    },
  );

  Widget _buildFixturesCard(
      {@required String title, @required Widget detailWidget}) {
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
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Divider(color: AppColors.white),
            detailWidget
          ],
        ),
      ),
    );
  }

  Widget _buildDateToBeConfirmedCard() {
    return _buildFixturesCard(
      title: AppStrings.dateToBeConfirmed,
      detailWidget: Column(
          children: _unconfirmedMatchesMockList.map((data) {
        int index = _unconfirmedMatchesMockList.indexOf(data);
        return Column(
          children: <Widget>[
            _buildFixtureDateToConfirmTile(matchData: data),
            index < (_unconfirmedMatchesMockList.length - 1)
                ? Divider(color: Colors.white54)
                : SizedBox.shrink(),
          ],
        );
      }).toList()),
    );
  }

  Widget _buildConfirmedDateCard() {
    return _buildFixturesCard(
      title: AppStrings.confirmedDate,
      detailWidget: Column(
          children: _confirmedMatchesMockList.map((data) {
        int index = _confirmedMatchesMockList.indexOf(data);
        return Column(
          children: <Widget>[
            _buildFixtureDateToConfirmTile(matchData: data),
            index < (_confirmedMatchesMockList.length - 1)
                ? Divider(color: Colors.white54)
                : SizedBox.shrink(),
          ],
        );
      }).toList()),
    );
  }

  Widget _buildTeamTitleAndLogoRow(
      {@required String teamName,
      @required String teamAsset,
      @required bool isTeamHome}) {
    final List<Widget> childWidgetList = List.from([
      Expanded(
        child: Text(
          teamName,
          textAlign: isTeamHome ? TextAlign.right : TextAlign.left,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      SizedBox(
        width: 4.0,
      ),
      SizedBox(
        height: 24.0,
        width: 24.0,
        child: Center(
          child: Image.asset(teamAsset),
        ),
      ),
      SizedBox(
        width: 8.0,
      ),
    ], growable: false);

    return Row(
      mainAxisAlignment:
          isTeamHome ? MainAxisAlignment.end : MainAxisAlignment.start,
      children:
          isTeamHome ? childWidgetList : childWidgetList.reversed.toList(),
    );
  }

  Widget _buildFixtureDateToConfirmTile(
      {@required Map<String, String> matchData}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 24.0,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: _buildTeamTitleAndLogoRow(
                  teamName: matchData['homeTeam'],
                  teamAsset: matchData['homeTeamLogoAsset'],
                  isTeamHome: true,
                )),
                SizedBox(width: 8.0),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white30),
                  ),
                  child: Center(
                      child: Text(
                    matchData['matchTime'],
                    style: TextStyle(color: AppColors.white),
                  )),
                ),
                SizedBox(width: 8.0),
                Expanded(
                    child: _buildTeamTitleAndLogoRow(
                        teamName: matchData['awayTeam'],
                        teamAsset: matchData['awayTeamLogoAsset'],
                        isTeamHome: false)),
              ],
            ),
          ),
          SizedBox(
            width: 24.0,
            child: Center(
              child:
                  Icon(Icons.arrow_forward, color: AppColors.white, size: 14.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColorElevated16,
        title: Text(
          AppStrings.fixtures,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: <Widget>[
              _buildDateToBeConfirmedCard(),
              SizedBox(height: 24.0),
              _buildConfirmedDateCard(),
            ],
          ),
        ),
      ),
    );
  }
}
