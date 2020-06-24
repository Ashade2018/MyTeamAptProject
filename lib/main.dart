import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/pages/auth/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppStrings.appTitle,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}
