import 'package:flutter/material.dart';
import '../Avaliacoes/PageForm.dart';
import '../Home/PageInicial.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'CadastrarUsuario.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GerarCodigo extends StatefulWidget {
  @override
  _GerarCodigo createState() => _GerarCodigo();
}

class _GerarCodigo extends State<GerarCodigo> {
  var titulo = "Gerar código para cadastro de outros usuários";
  var codigoGerado = "Clique no botão abaixo para gerar o código";
  var infoCodigo = "";
  var retorno;
  //Controllers para armazenar os valores digitados
  final TextEditingController controllerCodigo = TextEditingController();

  void gerarCodigo() async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/codigoUser/cadastrar.php?chave=avaies99');

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      this.retorno = jsonResponse;
    });

    //Após enviar a solicitação de novo código, obtém o retorno do código gerado e exibe ao usuário
    this.codigoGerado = retorno;
    this.infoCodigo =
        "Compartilhe o código acima com a pessoa do cpa que deseja fazer cadastro";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text(
          'Cadastro CPA',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 60,
              width: 300,
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 60,
              width: 300,
              child: Text(
                codigoGerado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 60,
              width: 300,
              child: Text(
                infoCodigo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.tealAccent[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Text(
                  'Gerar código',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  gerarCodigo();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
