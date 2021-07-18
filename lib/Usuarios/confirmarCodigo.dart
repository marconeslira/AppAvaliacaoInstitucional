import 'package:flutter/material.dart';
import '../Avaliacoes/PageForm.dart';
import '../Home/PageInicial.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'CadastrarUsuario.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmarCodigo extends StatefulWidget {
  @override
  _ConfirmarCodigo createState() => _ConfirmarCodigo();
}

class _ConfirmarCodigo extends State<ConfirmarCodigo> {
  //Controllers para armazenar os valores digitados
  final TextEditingController controllerCodigo = TextEditingController();

  //Pesquisa se o código informado pelo usuário existe na base de dados
  void buscarCodigo() async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/codigoUser/buscar.php?chave=avaies99');

    final res = await http.post(url, body: {
      "codigo": controllerCodigo.text,
    });

    final data = jsonDecode(res.body);

    if (data == "Sucesso") {
      alterarStatusCodigo();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CadastrarUsuario()));
    } else {
      setState(() {
        final snackBar = SnackBar(
            content:
                Text('Esse código está errado ou já pode ter sido utilizado'),
            backgroundColor: Colors.red);
        Colors.white;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  //Caso o usuário consiga utilizar o código, está função altera o status código para já utilizado
  void alterarStatusCodigo() async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/codigoUser/atualizarUtilizado.php?chave=avaies99');

    final res = await http.post(url, body: {
      "codigo": controllerCodigo.text,
    });

    final data = jsonDecode(res.body);
  }

  validarCampos() {
    var codigoValidar = controllerCodigo.text;

    if (codigoValidar.isEmpty) {
      setState(() {
        final snackBar = SnackBar(
            content: Text('Insira um código'), backgroundColor: Colors.red);
        Colors.white;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      buscarCodigo();
    }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 150,
                  margin: EdgeInsets.only(top: 20, bottom: 20),
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
                    "Insira o código:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 60,
              width: 300,
              child: TextField(
                controller: controllerCodigo,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Código gerado',
                  border: null,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 250,
                    height: 40,
                    margin: EdgeInsets.only(top: 30),
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
                        validarCampos();
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
