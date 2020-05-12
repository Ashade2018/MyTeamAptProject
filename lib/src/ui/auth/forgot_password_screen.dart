import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/auth/reset_password_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  Widget _buildEmailAddressTextSection() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: 80),
      child: Text(
        AppStrings.emailAddress,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildEmailAddressTextFormSection() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: AppStrings.emailAddress,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildResetPasswordButtonSection(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  AppStrings.resetPassword,
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
        backgroundColor: AppColors.backgroundColor,
        title: Text(AppStrings.forgotPassword),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _buildEmailAddressTextSection(),
                _buildEmailAddressTextFormSection(),
                _buildResetPasswordButtonSection(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
