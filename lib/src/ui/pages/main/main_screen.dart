import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/ui/pages/main/tabs/latest_tab.dart';
import 'package:league_app/src/ui/pages/main/tabs/league_tab.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    LatestTab(),
    LeagueTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.backgroundColorElevated16,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          items: [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.newspaper),
              title: Text(AppStrings.latest),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.soccer),
              title: Text(AppStrings.league),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
