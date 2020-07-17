import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_colors.dart';

///This is used for the [BottomNavigationBar] tab pages.
///It has a custom title widget and contains a
///[SingleChildScrollView] that wraps around the child
///widget
class TabBackgroundWrapper extends StatelessWidget {
  final String title;
  final Widget body;

  const TabBackgroundWrapper({Key key, @required this.title, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.backgroundColor,
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              body ?? SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
