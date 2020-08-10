import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';

class TableScreen extends StatelessWidget {
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
      'matchTime': '${index}:30',
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
    {
      'position': 6,
      'club': 'Liverpool',
      'imageAsset': AppAssets.liverpoolClubIconImage,
      'played': 82,
      'goalDifference': 82,
      'points': 82
    },
    {
      'position': 7,
      'club': 'Man City',
      'imageAsset': AppAssets.manCityClubIconImage,
      'played': 57,
      'goalDifference': 57,
      'points': 57
    },
    {
      'position': 8,
      'club': 'Leicester',
      'imageAsset': AppAssets.leicesterClubIconImage,
      'played': 53,
      'goalDifference': 53,
      'points': 53
    },
    {
      'position': 9,
      'club': 'Chelsea',
      'imageAsset': AppAssets.chelseaClubIconImage,
      'played': 48,
      'goalDifference': 48,
      'points': 48
    },
    {
      'position': 10,
      'club': 'Man Utd',
      'imageAsset': AppAssets.manUtdClubIconImage,
      'played': 45,
      'goalDifference': 45,
      'points': 45
    },
    {
      'position': 11,
      'club': 'Liverpool',
      'imageAsset': AppAssets.liverpoolClubIconImage,
      'played': 82,
      'goalDifference': 82,
      'points': 82
    },
    {
      'position': 12,
      'club': 'Man City',
      'imageAsset': AppAssets.manCityClubIconImage,
      'played': 57,
      'goalDifference': 57,
      'points': 57
    },
    {
      'position': 13,
      'club': 'Leicester',
      'imageAsset': AppAssets.leicesterClubIconImage,
      'played': 53,
      'goalDifference': 53,
      'points': 53
    },
    {
      'position': 14,
      'club': 'Chelsea',
      'imageAsset': AppAssets.chelseaClubIconImage,
      'played': 48,
      'goalDifference': 48,
      'points': 48
    },
    {
      'position': 15,
      'club': 'Man Utd',
      'imageAsset': AppAssets.manUtdClubIconImage,
      'played': 45,
      'goalDifference': 45,
      'points': 45
    },
    {
      'position': 16,
      'club': 'Liverpool',
      'imageAsset': AppAssets.liverpoolClubIconImage,
      'played': 82,
      'goalDifference': 82,
      'points': 82
    },
    {
      'position': 17,
      'club': 'Man City',
      'imageAsset': AppAssets.manCityClubIconImage,
      'played': 57,
      'goalDifference': 57,
      'points': 57
    },
    {
      'position': 18,
      'club': 'Leicester',
      'imageAsset': AppAssets.leicesterClubIconImage,
      'played': 53,
      'goalDifference': 53,
      'points': 53
    },
    {
      'position': 19,
      'club': 'Chelsea',
      'imageAsset': AppAssets.chelseaClubIconImage,
      'played': 48,
      'goalDifference': 48,
      'points': 48
    },
    {
      'position': 20,
      'club': 'Man Utd',
      'imageAsset': AppAssets.manUtdClubIconImage,
      'played': 45,
      'goalDifference': 45,
      'points': 45
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColorElevated16,
        title: Text(
          AppStrings.table,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: _buildLeagueTableContainer(context),
        ),
      ),
    );
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
            ],
          ),
        ));
  }
}
