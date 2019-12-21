import 'package:flutter/material.dart';

class AppModel with ChangeNotifier {
  bool darkTheme = false;
  String locale = "en";

  void changeLanguage(String country) {
    locale = country;
    notifyListeners();
  }

  void updateTheme(bool theme) {
    darkTheme = theme;
    notifyListeners();
  }

}

