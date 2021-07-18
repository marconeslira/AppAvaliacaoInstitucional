import 'dart:ui';
import 'package:flutter/material.dart';
import '../Home/PageInicial.dart';
import 'dart:io';
import '../Home/Carregamento.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

//import 'package:url_launcher/url_launcher.dart';

class Sobre extends StatefulWidget {
  @override
  _Sobre createState() => _Sobre();
}

class _Sobre extends State<Sobre> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  final String textoApp = "Avaliação institucional - 2021\n";
  final String textoAutor = "By: Marcones Lira";
  var quantidadeRespostas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sobre',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.tealAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    width: 280,
                    height: 250,
                    child: Image.asset('assets/imagens/logopolo.png'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    textoApp,
                    style: TextStyle(
                      fontFamily: 'KGred',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    textoAutor,
                    style: TextStyle(
                      fontFamily: 'KGred',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: TextButton(
                child: Text(
                  'https://polouabpalmares.ml/',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
