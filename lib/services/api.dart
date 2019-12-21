import 'package:connectivity/connectivity.dart';
import 'package:flutter_starter/models/user.dart';
import 'package:flutter_starter/services/dio_client.dart';
import 'package:flutter_starter/services/index.dart';
import 'package:global_configuration/global_configuration.dart';

class Api implements BaseServices {
  DioClient _dioClient;

  set dioClient(DioClient value) {
    if (_dioClient != value) {
      _dioClient = value;
      // do some extra work, that may call `notifyListeners()`
    }
  }

  @override
  Future<User> createUser(Map data) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return _dioClient.postAsync(
          GlobalConfiguration().getString("base_url") + ':3000/user', data);
    } else {
      throw Exception('No internet connection');
    }
  }

  @override
  Future<User> login(Map data) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return _dioClient.postAsync(
          GlobalConfiguration().getString('base_url') + ':3000/user', data);
    } else {
      throw Exception('No internet connection');
    }
  }
}
