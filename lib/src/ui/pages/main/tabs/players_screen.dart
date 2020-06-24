import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/data/app_assets.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title:
              Text(AppStrings.players, style: TextStyle(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                _buildPlayersListTile(),
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

  Widget _buildPlayersListTile() {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        dense: true,
        onTap: () {},
        contentPadding: EdgeInsets.only(left: 0, bottom: 0.0),
        leading: SizedBox(
          height: 50.0,
          width: 50.0,
          child: Image.asset(
            AppAssets.tammyAbrahamImage,
          ),
        ),
        title: Row(
          children: <Widget>[
            Text(
              AppStrings.tammyAbraham,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              AppStrings.forward,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: Colors.white,
              ),
            )
          ],
        ),
        subtitle: Row(
          children: <Widget>[
            SizedBox(
              height: 16,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset(
                  AppAssets.englandFlagImage,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              AppStrings.england,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
