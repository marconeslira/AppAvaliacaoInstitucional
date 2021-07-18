import 'dart:ui';
import 'package:flutter/material.dart';
import '../Home/PageInicial.dart';
import 'dart:io';
import '../Home/Carregamento.dart';

//import 'package:url_launcher/url_launcher.dart';

class ConfirmacaoCadastro extends StatefulWidget {
  @override
  _ConfirmacaoCadastro createState() => _ConfirmacaoCadastro();
}

class _ConfirmacaoCadastro extends State<ConfirmacaoCadastro> {
  @override
  void initState() {
    // TODO: implement initState
    //var nomeIes = "Faculdade: ${widget.faculdade}";
    //print(nomeIes);
    super.initState();
    //this.buscarAvaliacoes("${widget.faculdade}");
    this.carregamento();
  }

  void carregamento() {
    Future.delayed(Duration(seconds: 6)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PageInicial()));
    });
  }

  final String texto = "Cadastro realizado com sucesso";

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
