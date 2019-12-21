import 'package:flutter/material.dart';
import 'package:flutter_starter/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel with ChangeNotifier {
  Api _api;

  set api(Api value) {
    if (_api != value) {
      _api = value;
      // do some extra work, that may call `notifyListeners()`
    }
  }

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
      user = await _api.createUser(data);
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
      user = await _api.login(data);

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

class User {
  int id;
  bool loggedIn;
  String name;
  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  String picture;
  String token;

  User.fromJson(Map<String, dynamic> json) {
    try {
      var user = json['user'];
      loggedIn = true;
      id = json['id'];
      name = user['name'];
      username = user['username'];
      token = json['token'];
      firstName = user["first_name"];
      lastName = user["last_name"];
      email = user["email"];
      picture = user["picture"]['data']['url'] ?? '';
    } catch (e) {
      print(e.toString());
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "loggedIn": loggedIn,
      "name": name,
      "firstName": firstName,
      "lastName": lastName,
      "username": username,
      "email": email,
      "password": password,
      "picture": picture,
      "token": token
    };
  }

  @override
  String toString() => 'User { username: $id $name $email}';
}
