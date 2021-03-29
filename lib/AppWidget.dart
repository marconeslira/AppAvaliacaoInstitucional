import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'ConfirmPage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: LoginPage(),
    );
  }
}
