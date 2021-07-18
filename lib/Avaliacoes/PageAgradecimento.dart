import 'dart:ui';
import 'package:flutter/material.dart';
import '../Home/PageInicial.dart';
import 'dart:io';
import '../Home/Carregamento.dart';

class PageAgradecimento extends StatefulWidget {
  @override
  _PageAgradecimentoState createState() => _PageAgradecimentoState();
}

class _PageAgradecimentoState extends State<PageAgradecimento> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    this.carregamento();
  }

  void carregamento() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PageInicial()));
    });
  }

  final String texto = "Agradecemos sua importante\n"
      "Colaboração!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    width: 280,
                    height: 370,
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
                    texto,
                    style: TextStyle(
                      fontFamily: 'KGred',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //loading do splash
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CarregamentoLoading(),
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
                  'by: Marcones Lira',
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
