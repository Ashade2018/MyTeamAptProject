import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/auth/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  Padding _buildLeagueAppTitleTextSection() {return Padding(
    padding: EdgeInsets.symmetric(vertical: 130),
    child: Text(
      AppStrings.appTitle.toUpperCase(),
      style: TextStyle(
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          fontSize: 32.0,
          color: Colors.white),
    ),
  );}

  Padding _buildSignUpButtonSection() {return Padding(
    padding: EdgeInsets.symmetric(vertical: 30),
    child: FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: null,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              AppStrings.signUp,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    ),
  );}

  Padding _buildAlreadyHaveAnAccountTextSection() {return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Text(
      AppStrings.alreadyHaveAnAccount,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  );}

  FlatButton _buildLogInButtonSection(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              AppStrings.logIn,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                _buildLeagueAppTitleTextSection(),
                _buildSignUpButtonSection(),
                _buildAlreadyHaveAnAccountTextSection(),
                _buildLogInButtonSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
