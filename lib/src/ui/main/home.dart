import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/data/app_colors.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    Center(
        child: Text(
      AppStrings.home,
      style: TextStyle(fontSize: 30.0, color:Colors.white),
    )),
    Center(
        child: Text(
      AppStrings.search,
      style: TextStyle(fontSize: 30.0,color:Colors.white),
    )),
    Center(
        child: Text(
      AppStrings.teams,
      style: TextStyle(fontSize: 30.0,color:Colors.white),
    )),
    Center(
        child: Text(
      AppStrings.notifications,
      style: TextStyle(fontSize: 30.0, color:Colors.white),
    )),
    Center(
        child: Text(
      AppStrings.profile,
      style: TextStyle(fontSize: 30.0, color:Colors.white),
    )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorElevated12,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor:AppColors.backgroundColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(AppStrings.home),
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(AppStrings.search),
              
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
