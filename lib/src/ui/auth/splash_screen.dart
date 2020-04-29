import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff177E89),
      body: Center(
        child: Text(
          'LEAGUE APP',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 30.0,
              color: Colors.white),
        ),
      ),
    );
  }
}



