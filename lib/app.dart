import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/providers/app_provider.dart';
import 'package:flutter_starter/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/i18n.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, AppProvider appProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale(appProvider.locale, ""),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: appProvider.theme,
          home: SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen)
      return false;
    else {
      prefs.setBool('seen', true);
      return true;
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).popUntil((predicate) => predicate.isFirst);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
