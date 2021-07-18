import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CarregamentoLoading extends StatefulWidget {
  @override
  _CarregamentoLoading createState() => _CarregamentoLoading();
}

class _CarregamentoLoading extends State<CarregamentoLoading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[SpinKitFadingCircle(color: Colors.black)],
        )
      ],
    );
  }
}
