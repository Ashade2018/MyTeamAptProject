import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/season/season_details_screen.dart';

class SeasonsScreen extends StatelessWidget {
  final List<String> _seasonList = [
    'Winter',
    'Summer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.seasons,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: ListView.builder(
          itemCount: _seasonList.length,
          itemBuilder: (context, index) {
            String seasonName = _seasonList[index];
            return Column(
              children: <Widget>[
                _buildSeasonsListTile(seasonName: seasonName, context: context),
                Divider(
                  color: Colors.white54,
                  height: 0.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSeasonsListTile(
      {@required String seasonName, @required BuildContext context}) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        dense: true,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SeasonDetailsScreen(
                        seasonName: seasonName,
                      )));
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        leading: SizedBox(
            height: 50.0,
            width: 50.0,
            child: IconButton(
              icon: Icon(
                MaterialCommunityIcons.soccer,
              ),
              color: Colors.white,
              onPressed: () {},
            )),
        title: Text(
          seasonName,
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
