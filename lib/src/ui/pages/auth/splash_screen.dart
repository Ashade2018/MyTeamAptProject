import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/auth/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          AppStrings.appTitle.toUpperCase(),
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
