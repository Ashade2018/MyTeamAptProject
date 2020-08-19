import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/models/player.dart';
import 'package:league_app/src/util/date_time_util.dart';

class PlayerDetailsScreen extends StatelessWidget {
  final Player player;

  const PlayerDetailsScreen({Key key, @required this.player}) : super(key: key);
  Widget _buildPlayerSection() {
    return SizedBox(
      height: 200.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Image.network(player.imageUrl),
            ),
            SizedBox(
              width: 16.0,
            ),
            Flexible(
              flex: 6,
              child: Center(
                child: Text(
                  player.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDetails(
      {@required String title, @required String detail}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w100),
          ),
          Text(
            detail,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPersonalDetailsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Card(
        color: AppColors.backgroundColorElevated16,
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.personalDetails,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 16.0),
              Divider(color: Colors.white),
              _buildPersonalDetails(
                title: AppStrings.dateOfBirth,
                detail: DateTimeUtil().getDateString(player.dateOfBirth),
              ),
              Divider(color: Colors.white),
              _buildPersonalDetails(
                title: AppStrings.nationality,
                detail: player.nationality,
              )
            ],
          ),
        ),
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
          player.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildPlayerSection(),
            _buildDivider(),
            _buildPersonalDetailsCard()
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 20.0,
      color: AppColors.backgroundColorElevated16,
    );
  }
}
