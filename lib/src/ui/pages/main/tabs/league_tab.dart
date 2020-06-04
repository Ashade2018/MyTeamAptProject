import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class LeagueTab extends StatelessWidget {
  const LeagueTab({Key key}) : super(key: key);

  Widget _buildStatsSection() {
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
        onTap: () {},
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

  Widget _buildPeopleSection() {
    return Column(
      children: <Widget>[
        _buildLeagueItemTile(title: AppStrings.players, onTap: () {}),
        SizedBox(
          height: 8.0,
        ),
        _buildLeagueItemTile(title: AppStrings.teams, onTap: () {}),
      ],
    );
  }

  Widget _buildInformationSection() {
    return Column(
      children: <Widget>[
        _buildLeagueItemTile(title: AppStrings.news, onTap: () {}),
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
          _buildStatsSection(),
          SizedBox(
            height: 24,
          ),
          _buildPeopleSection(),
          SizedBox(
            height: 24,
          ),
          _buildInformationSection(),
        ],
      ),
    );
  }
}
