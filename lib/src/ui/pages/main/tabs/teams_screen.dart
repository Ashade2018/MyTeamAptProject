import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/main/tabs/teams/team_details_screen.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

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

  @override
  Widget build(BuildContext context) {
    void _navigateToTeamDetailsScreen() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TeamDetailScreen()));
    }

    return TabBackgroundWrapper(
      title: AppStrings.teams,
      body: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _teamList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: _navigateToTeamDetailsScreen,
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
          }),
    );
  }
}
