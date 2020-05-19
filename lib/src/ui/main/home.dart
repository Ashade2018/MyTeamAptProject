import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/ui/main/home_screen.dart';
import 'package:league_app/src/ui/main/news_screen.dart';
import 'package:league_app/src/ui/main/notification_screen.dart';
import 'package:league_app/src/ui/main/profile_screen.dart';
import 'package:league_app/src/ui/main/teams_screen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomeScreen(),
    NewsScreen(),
    TeamsScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.backgroundColorElevated12,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(AppStrings.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text(AppStrings.news),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_tilt_shift),
              title: Text(AppStrings.teams),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text(AppStrings.notifications),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(AppStrings.profile),
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
