import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          'LEAGUE APP',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 32.0,
              color: Colors.white),
        ),
      ),
    );
  }
}
