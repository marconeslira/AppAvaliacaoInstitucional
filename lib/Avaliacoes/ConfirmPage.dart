import 'package:flutter/material.dart';
import 'PageForm.dart';
import '../Home/PageInicial.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  final String texto = "Caro Alun@,\n\n"
      "Sua Participação nesta Avaliação é muito Importante\n"
      "para nos ajudar a melhorar cada vez mais a\n"
      "qualidade de nossos serviços!\n\n"
      "Atenciosamente,\n"
      "Coord. do Polo UAB Palmares";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text(
          'Bem Vind@!',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 150,
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  child: Image.asset('assets/imagens/logopolo.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    texto,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    '* Não solicitamos Dados Pessoais.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amberAccent,
                        onPrimary: Colors.tealAccent[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        'Continuar',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PageForm()));
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
