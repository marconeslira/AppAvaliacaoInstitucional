import 'package:flutter/material.dart';
import '../Avaliacoes/PageForm.dart';
import '../Home/PageInicial.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../Avaliacoes/PageAgradecimento.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Home/PageInicial.dart';

class EditarUsuario extends StatefulWidget {
  var nome;
  var email;
  var senha;
  var idUser;

  EditarUsuario(this.nome, this.email, this.senha, this.idUser);

  @override
  _EditarUsuario createState() => _EditarUsuario();
}

class _EditarUsuario extends State<EditarUsuario> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    this.valoresIniciais(
        "${widget.nome}", "${widget.email}", "${widget.senha}");
  }

  //Controllers para armazenar os valores digitados
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  void editarUsuario(var idUsuario) async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/Usuarios/editar.php?chave=avaies99');

    final res = await http.post(url, body: {
      "nome": this.controllerNome.text,
      "email": this.controllerEmail.text,
      "senha": this.controllerSenha.text,
      "idUsuario": idUsuario,
    });

    final data = jsonDecode(res.body);

    if (data == "Sucesso") {
      setState(() {
        final snackBar = SnackBar(
            content: Text('Dados alterados com sucesso'),
            backgroundColor: Colors.teal);
        Colors.white;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      setState(() {
        final snackBar = SnackBar(
            content: Text('Erro ao tentar alterar os dados'),
            backgroundColor: Colors.red);
        Colors.white;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  //Recebe os dados atuais do user logado, e insere eles no input de edição
  void valoresIniciais(var nome, var email, var senha) async {
    controllerNome.text = nome;
    controllerEmail.text = email;
    controllerSenha.text = senha;
  }

  @override
  Widget build(BuildContext context) {
    var id = "${widget.idUser}";
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          "${widget.nome}",
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
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
                        'Dados atuais: ',
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
                      'Alterar',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      editarUsuario(id);
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
