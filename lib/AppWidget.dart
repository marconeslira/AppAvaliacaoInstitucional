import 'package:flutter/material.dart';
import 'PageInicial.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: PageInicial(),
    );
  }
}
