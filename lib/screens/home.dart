import 'package:flutter/material.dart';
import 'package:flutter_starter/generated/i18n.dart';
import 'package:flutter_starter/screens/language.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Center(
              child: Text(S.of(context).app_name),
            ),
            RaisedButton(
              child: Text('Language Screen'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Language()));
              },
            )
          ],
        ),
      ),
    );
  }
}
