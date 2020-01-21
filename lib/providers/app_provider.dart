import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    init();
  }

  String locale = 'en';
  ThemeData theme = Constants.lightTheme;

  void changeTheme({@required bool isLight}) {
    theme = isLight ? Constants.lightTheme : Constants.darkTheme;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isLight', isLight).then((val) {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor:
              isLight ? Constants.lightPrimary : Constants.darkPrimary,
          statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
        ));
      });
    });
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;
  }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLight = prefs.getBool('isLight');
    locale =
        prefs.getString('locale') == null ? 'en' : prefs.getString('locale');
    changeTheme(isLight: isLight);
  }

  void changeLanguage(String value) async {
    locale = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', value);
    notifyListeners();
  }
}
