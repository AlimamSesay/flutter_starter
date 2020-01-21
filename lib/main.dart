import 'package:flutter/material.dart';
import 'package:flutter_starter/providers/app_provider.dart';
import 'package:flutter_starter/providers/user_provider.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';
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
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: App(),
  ));
}
