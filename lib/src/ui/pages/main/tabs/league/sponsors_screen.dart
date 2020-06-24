import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title:
              Text(AppStrings.sponsors, style: TextStyle(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                _buildSponsorsListTile(),
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

  Widget _buildSponsorsListTile() {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        dense: true,
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        leading: SizedBox(
          height: 50.0,
          width: 50.0,
          child: Image.asset(
            AppAssets.flyEmiratesImage,
          ),
        ),
        title: Text(
          AppStrings.emirates,
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.open_in_browser,
          ),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
