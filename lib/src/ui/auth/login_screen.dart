import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/auth/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final Widget _logInTitleSection = Padding(
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
            AppStrings.logIn,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );

  final Widget _logInWithTextSection = Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Text(
      AppStrings.logInWith,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    ),
  );

  FlatButton _buildAuthButton({String imageAsset, String label}) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
            child: Row(
              children: <Widget>[
                Image.asset(imageAsset),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _authenticationSignInButton() => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: _buildAuthButton(
                  label: AppStrings.facebook,
                  imageAsset: 'assets/facebook_icon.png'),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
                flex: 7,
                child: _buildAuthButton(
                    label: AppStrings.google,
                    imageAsset: 'assets/google_icon.png'))
          ],
        ),
      );

  final Widget _dividerSection = Padding(
    padding: EdgeInsets.symmetric(vertical: 20.0),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Divider(
            indent: 100,
            thickness: 2,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            AppStrings.or.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Divider(
            endIndent: 100,
            thickness: 2,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );

  final Widget _emailAddressTextSection = Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      AppStrings.emailAddress,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    ),
  );

  Widget _textFormSectionEmail() => _buildTextForm(
      hintText: AppStrings.emailAddress,
      isTextObscure: false,
      textInputType: TextInputType.emailAddress);

  final Widget _passwordTextSection = Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      AppStrings.password,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    ),
  );

  Widget _textFormSectionPassword() => _buildTextForm(
      hintText: AppStrings.password,
      isTextObscure: true,
      textInputType: TextInputType.visiblePassword);

  TextFormField _buildTextForm(
      {TextInputType textInputType, String hintText, bool isTextObscure}) {
    return TextFormField(
      obscureText: isTextObscure,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildForgotPasswordClickableTextSection(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
      },
      padding: EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.forgotPassword,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  final Widget _logInButtonSection = Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: null,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF177E89),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              AppStrings.logIn,
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
        color: Color(0xFF323031),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _logInTitleSection,
                _logInWithTextSection,
                _authenticationSignInButton(),
                _dividerSection,
                _emailAddressTextSection,
                _textFormSectionEmail(),
                _passwordTextSection,
                _textFormSectionPassword(),
                _buildForgotPasswordClickableTextSection(context),
                _logInButtonSection,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
