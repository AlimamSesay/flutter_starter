import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  User user;
  bool loggedIn = false;
  bool loading = false;

  void saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  void getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('token');
  }

  void createUser(Map data, {Function success, Function fail}) async {
    try {
      loading = true;
      notifyListeners();
      // user = await _api.createUser(data);
      loggedIn = true;
      saveUserToken(user.token);
      success(user);

      loading = false;
      notifyListeners();
    } catch (err) {
      fail(err.toString());
      loading = false;
      notifyListeners();
    }
  }

  void logout() async {
    user = null;
    loggedIn = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    notifyListeners();
  }

  void login(Map data, {Function success, Function fail}) async {
    try {
      loading = true;
      notifyListeners();
      //user = await _api.login(data);

      loggedIn = true;
      saveUserToken(user.token);
      success(user);
      loading = false;
      notifyListeners();
    } catch (err) {
      loading = false;
      fail(err.toString());
//      print('login err $err');
      notifyListeners();
    }
  }
}
