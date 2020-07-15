import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:league_app/src/ui/pages/main/main_screen.dart';
import 'package:http/http.dart';
import 'package:league_app/src/services/sign_up_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;

  Widget _buildSignUpWithTextSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        AppStrings.signUpWith,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildAuthButton(
      {@required String imageAsset, @required String label}) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: null,
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

  Widget _authenticationSignUpButton() {
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

  Widget _buildEmailTextFormField() => _buildTextForm(
      controller: _emailController,
      hintText: AppStrings.emailAddress,
      isTextObscure: false,
      textInputType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return AppStrings.emailAddress + AppStrings.emptyFieldErrorMessage;
        }
        if (!EmailValidator.validate(value.trim())) {
          return AppStrings.enterValidEmail;
        }
        return null;
      });

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

  Widget _buildPasswordTextFormField() => _buildTextForm(
        controller: _passwordController,
        hintText: AppStrings.password,
        isTextObscure: true,
        textInputType: TextInputType.visiblePassword,
        validator: (String value) {
          if (value.isEmpty) {
            return AppStrings.password + AppStrings.emptyFieldErrorMessage;
          }

          return null;
        },
      );

  Widget _buildConfirmPasswordTextSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        AppStrings.confirmPassword,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordTextFormField() => _buildTextForm(
      controller: _confirmPasswordController,
      hintText: AppStrings.confirmPassword,
      isTextObscure: true,
      textInputType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return AppStrings.confirmPassword + AppStrings.emptyFieldErrorMessage;
        }
        if (value != _passwordController.text) {
          return AppStrings.doesNotMatchErrorMessage + AppStrings.password;
        }
        return null;
      });

  Widget _buildTextForm(
      {@required TextInputType textInputType,
      @required String hintText,
      @required bool isTextObscure,
      @required String Function(String) validator,
      @required TextEditingController controller}) {
    return TextFormField(
      obscureText: isTextObscure,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      validator: validator,
      controller: controller,
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildEmailAddressTextSection(),
          _buildEmailTextFormField(),
          _buildPasswordTextSection(),
          _buildPasswordTextFormField(),
          _buildConfirmPasswordTextSection(),
          _buildConfirmPasswordTextFormField(),
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _signUp(context);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF177E89),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
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
          )
        ],
      ),
    );
  }

  Future<void> _signUp(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    Client client = Client();
    SignUpService signUpService = SignUpService(client);
    bool signUpStatus = await signUpService.signUp();

    setState(() {
      _isLoading = false;
    });

    if (signUpStatus) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      final SnackBar snackBar = SnackBar(
          content: Text(
            AppStrings.signUpSnackbarErrorMessge,
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
            title:
                Text(AppStrings.signUp, style: TextStyle(color: Colors.white))),
        body: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              color: AppColors.backgroundColor,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      _buildSignUpWithTextSection(),
                      _authenticationSignUpButton(),
                      _buildDividerSection(),
                      _buildForm(context)
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
        ));
  }

  Widget _buildLoadingIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
}
