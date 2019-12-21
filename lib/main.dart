import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await GlobalConfiguration()
        .loadFromUrl("http://192.168.1.9/app_settings.json");
  } catch (e) {
// GlobalConfiguration().loadFromPath("/path/file.json");
    await GlobalConfiguration().loadFromAsset("app_settings");
  }
  runApp(App());
}