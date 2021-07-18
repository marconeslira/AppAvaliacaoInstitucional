import 'package:flutter/material.dart';
import '../Avaliacoes/PageForm.dart';
import '../Home/PageInicial.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../Avaliacoes/PageAgradecimento.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ConfirmacaoCadastro.dart';

class CadastrarUsuario extends StatefulWidget {
  @override
  _CadastrarUsuario createState() => _CadastrarUsuario();
}

class _CadastrarUsuario extends State<CadastrarUsuario> {
  //Controllers para armazenar os valores digitados
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  void cadastrarUsuario() async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/Usuarios/cadastrar.php?chave=avaies99');

    final res = await http.post(url, body: {
      "nome": this.controllerNome.text,
      "email": this.controllerEmail.text,
      "senha": this.controllerSenha.text,
      "idIes": "3",
    });

    final data = jsonDecode(res.body);

    //Verifica o retorno obtido após enviar a requisição de cadastro
    if (data == "Sucesso") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ConfirmacaoCadastro()));
    } else {
      Fluttertoast.showToast(
          msg: "Verifique os dados e tente novamente",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Cadastro usuário',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 320,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Preencha as seguintes informações: ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: controllerNome,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  child: TextField(
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  child: TextField(
                    controller: controllerSenha,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 40,
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent,
                      onPrimary: Colors.tealAccent[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      cadastrarUsuario();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
