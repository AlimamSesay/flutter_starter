import 'package:flutter/material.dart';
import 'package:flutter_starter/generated/i18n.dart';
import 'package:flutter_starter/models/app.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Text(S.of(context).app_name),
            ),
          ),
        );
      },
    );
  }
}
