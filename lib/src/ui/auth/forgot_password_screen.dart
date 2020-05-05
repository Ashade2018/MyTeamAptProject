import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final Widget _forgotPasswordTitleSection = Padding(
    padding: EdgeInsets.only(bottom: 20.0),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            AppStrings.forgotPassword,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );

  final Widget _emailAddressTextSection = Padding(
    padding: EdgeInsets.only(bottom: 10, top: 80),
    child: Text(
      AppStrings.emailAddress,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    ),
  );

  final Widget _emailAddressTextFormSection = TextFormField(
    obscureText: false,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: AppStrings.emailAddress,
      border: OutlineInputBorder(),
    ),
  );

  final Widget _resetPasswordButtonSection = Padding(
    padding: EdgeInsets.symmetric(vertical: 40),
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
      body: Container(
        constraints: BoxConstraints.expand(),
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _forgotPasswordTitleSection,
                _emailAddressTextSection,
                _emailAddressTextFormSection,
                _resetPasswordButtonSection
              ],
            ),
          ),
        ),
      ),
    );
  }
}
