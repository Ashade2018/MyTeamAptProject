import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/main/tabs/news_screen.dart';
import 'package:league_app/src/ui/pages/main/tabs/teams_screen.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class LeagueTab extends StatelessWidget {
  const LeagueTab({Key key}) : super(key: key);

  Widget _buildStatsSection(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildLeagueItemTile(title: AppStrings.fixtures, onTap: () {}),
        SizedBox(
          height: 8.0,
        ),
        _buildLeagueItemTile(title: AppStrings.table, onTap: () {}),
      ],
    );
  }

  Widget _buildLeagueItemTile(
      {@required String title, @required void Function() onTap}) {
    return Card(
      color: AppColors.backgroundColorElevated12,
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPeopleSection(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildLeagueItemTile(title: AppStrings.players, onTap: () {}),
        SizedBox(
          height: 8.0,
        ),
        _buildLeagueItemTile(
            title: AppStrings.teams,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeamsScreen()));
            }),
      ],
    );
  }

  Widget _buildInformationSection(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildLeagueItemTile(
            title: AppStrings.news,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsScreen()));
            }),
        SizedBox(
          height: 8.0,
        ),
        _buildLeagueItemTile(title: AppStrings.seasons, onTap: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TabBackgroundWrapper(
      title: AppStrings.bigLeague,
      body: Column(
        children: <Widget>[
          _buildStatsSection(context),
          SizedBox(
            height: 24,
          ),
          _buildPeopleSection(context),
          SizedBox(
            height: 24,
          ),
          _buildInformationSection(context),
        ],
      ),
    );
  }
}
