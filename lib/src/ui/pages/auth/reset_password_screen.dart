import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/auth/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  Widget _buildPasswordResetInstructionsTextSection() {
    return Padding(
      padding: EdgeInsets.only(top: 80),
      child: Text(
        AppStrings.passwordResetScreenInstruction,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildBackToLoginButtonSection(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  AppStrings.backToLogin,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        title: Text(AppStrings.passwordResetScreenTitle,
            style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              _buildPasswordResetInstructionsTextSection(),
              _buildBackToLoginButtonSection(context),
            ],
          ),
        ),
      ),
    );
  }
}
