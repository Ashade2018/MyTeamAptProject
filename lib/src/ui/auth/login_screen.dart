import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/auth/forgot_password_screen.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/services/login_service.dart';
import 'package:league_app/src/ui/main/home.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  Widget _buildLogInWithTextSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        AppStrings.logInWith,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildAuthButton({String imageAsset, String label}) {
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

  Widget _authenticationSignInButton() {
    return Padding(
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
  }

  Widget _buildDividerSection() {
    return Padding(
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
  }

  Widget _buildEmailAddressTextSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        AppStrings.emailAddress,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _textFormSectionEmail() => _buildTextForm(hintText: AppStrings.emailAddress, isTextObscure: false, textInputType: TextInputType.emailAddress);

  Widget _buildPasswordTextSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        AppStrings.password,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _textFormSectionPassword() => _buildTextForm(hintText: AppStrings.password, isTextObscure: true, textInputType: TextInputType.visiblePassword);

  Widget _buildTextForm(
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
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
            (_) => false);
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

  Widget _buildLogInButtonSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          _login(context);
        },
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
  }

  Future<void> _login(BuildContext context) async {

    setState(() {
      _isLoading = true;
    });

    Client client = Client();
    LoginService loginService = LoginService(client);
    bool loginStatus = await loginService.login();

    setState(() {
      _isLoading = false;
    });

    if (loginStatus) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Home()));
    } else {
      final SnackBar snackBar = SnackBar(
          content: Text(
            'Could not login.',
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
          title: Text(AppStrings.logIn)),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            color: Color(0xFF323031),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    _buildLogInWithTextSection(),
                    _authenticationSignInButton(),
                    _buildDividerSection(),
                    _buildEmailAddressTextSection(),
                    _textFormSectionEmail(),
                    _buildPasswordTextSection(),
                    _textFormSectionPassword(),
                    _buildForgotPasswordClickableTextSection(context),
                    _buildLogInButtonSection(context),
                  ],
                ),
              ),
            ),
          ),
          _isLoading
              ? Center(
                  child: _buildLoadingIndicator(),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
}
