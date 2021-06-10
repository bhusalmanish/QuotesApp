import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(AppRun());
}

class AppRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text("Quotes App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        body: HomePage(),
      ),
    );
  }
}
