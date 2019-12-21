import 'package:flutter_starter/models/user.dart';

abstract class BaseServices {
  Future<User> createUser(Map data);

  Future<User> login(Map data);
}
