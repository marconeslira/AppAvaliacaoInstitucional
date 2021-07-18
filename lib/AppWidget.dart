import 'package:flutter/material.dart';
import 'Home/PageInicial.dart';
import 'Dashboard/PageDashboard.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: PageInicial(),
    );
  }
}
