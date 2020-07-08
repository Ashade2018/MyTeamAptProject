import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/fixtures_screen.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/news_screen.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/players_screen.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/sponsors_screen.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/teams_screen.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class LeagueTab extends StatelessWidget {
  const LeagueTab({Key key}) : super(key: key);

  Widget _buildStatsSection(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildLeagueItemTile(
            title: AppStrings.fixtures,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FixturesScreen()));
            }),
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
      color: AppColors.backgroundColorElevated16,
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
        _buildLeagueItemTile(
            title: AppStrings.players,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PlayersScreen()));
            }),
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

  Widget _buildSponsorSection(BuildContext context) {
    return Container(
      child: _buildLeagueItemTile(
          title: AppStrings.sponsor,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SponsorsScreen()));
          }),
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
          SizedBox(
            height: 24,
          ),
          _buildSponsorSection(context)
        ],
      ),
    );
  }
}
