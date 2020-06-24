import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/auth/reset_password_screen.dart';
import 'package:league_app/src/services/reset_password_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;

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
            _resetPassword(context);
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

  Future<void> _resetPassword(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    Client client = Client();
    ResetPasswordService resetPasswordService = ResetPasswordService(client);
    bool resetPasswordStatus = await resetPasswordService.resetPassword();

    setState(() {
      _isLoading = false;
    });

    if (resetPasswordStatus) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
    } else {
      final SnackBar snackBar = SnackBar(
          content: Text(
            'Could not reset password.',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white);
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(AppStrings.forgotPassword,
            style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: <Widget>[
          Container(
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
          _isLoading
              ? Center(
                  child: _buildLoadingIndicator(),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
}
