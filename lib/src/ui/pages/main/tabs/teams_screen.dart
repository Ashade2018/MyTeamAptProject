import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/teams/team_details_screen.dart';

class TeamsScreen extends StatelessWidget {
  final List<String> _teamList = [
    AppStrings.bournemouth,
    AppStrings.arsenal,
    AppStrings.astonVilla,
    AppStrings.brighton,
    AppStrings.burnley,
    AppStrings.chelsea,
    AppStrings.crystalPalace,
    AppStrings.everton,
    AppStrings.everton,
    AppStrings.leceisterCity,
    AppStrings.liverpool,
    AppStrings.manchesterCity,
    AppStrings.manchesterUnited,
    AppStrings.norwichCity,
    AppStrings.sheffieldUnited,
    AppStrings.southampton,
    AppStrings.totthamHotspur,
    AppStrings.watford,
    AppStrings.westham,
    AppStrings.wolverHampton,
  ];

  void _navigateToTeamDetailsScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TeamDetailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.teams,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.backgroundColorElevated12,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
          itemCount: _teamList.length,
          itemBuilder: (context, index) {
            return _buildTeamListTile(context, index: index);
          }),
    );
  }

  Widget _buildTeamListTile(BuildContext context, {@required int index}) {
    return Column(
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: ListTile(
            onTap: () => _navigateToTeamDetailsScreen(context),
            contentPadding: EdgeInsets.only(left: 0),
            leading: SizedBox(
              height: 30.0,
              width: 30.0,
              child: Image.asset(
                AppAssets.liverpoolLogo,
              ),
            ),
            title: Text(
              _teamList[index],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
      ],
    );
  }
}
