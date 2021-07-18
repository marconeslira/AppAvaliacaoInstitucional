import 'dart:ui';
//import 'package:avaliacao_institucional/PageForm.dart';
import 'package:flutter/material.dart';
import '../Avaliacoes/ConfirmPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:fluttertoast/fluttertoast.dart';
import '../Dashboard/PageDashboard.dart';
import '../Usuarios/confirmarCodigo.dart';

class PageInicial extends StatefulWidget {
  @override
  _PageInicialState createState() => _PageInicialState();
}

class _PageInicialState extends State<PageInicial> {
  //Controllers para armazenar os valores digitados
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  var dados;
  //Dados do usuário
  var nomeUser;
  var idUser;
  var razaoSocial;
  var senha;
  var idUsuario;

  //Atividades
  var atividadesDados;

  void _openSecondTela() async {
    String email;

    print(nomeUser);
    setState(() {
      email = controllerEmail.text;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PageDashboard(email, nomeUser, razaoSocial,
                  atividadesDados, senha, idUser)));
    });
  }

  void login() async {
    String emailInformado = this.controllerEmail.text;
    String senhaInformado = this.controllerSenha.text;

    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/Usuarios/login.php?chave=avaies99');

    final res = await http.post(url, body: {
      "loginEmail": emailInformado,
      "loginSenha": senhaInformado,
    });

    final data = jsonDecode(res.body);

    if (data == "Sucesso") {
      _openSecondTela();
    } else {
      setState(() {
        final snackBar = SnackBar(
            content: Text('Dados inválidos'), backgroundColor: Colors.red);
        Colors.white;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  //Busca informações do perfil que está feito o login (Para já iniciar a tela seguinte com os dados prontos)
  void _infoUserLogado() async {
    String emailBusca = this.controllerEmail.text;
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Usuarios/dados.php?chave=avaies99");

    final res = await http.post(url, body: {
      "email": emailBusca,
    });

    final dataa = jsonDecode(res.body);

    if (dataa != "Falha") {
      this.nomeUser = dataa['nome'];
      this.idUser = dataa['idUsuario'];
      this.razaoSocial = dataa['razaoSocial'];
      this.senha = dataa['senha'];
    }

    login();
  }

  //Verifica se os campos foram preenchidos no login
  validarCampos() {
    String emailValidar = this.controllerEmail.text;
    String senhaValidar = this.controllerSenha.text;

    if (emailValidar.isEmpty || senhaValidar.isEmpty) {
      setState(() {
        final snackBar = SnackBar(
            content: Text('Preencha os campos'), backgroundColor: Colors.red);
        Colors.white;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      _infoUserLogado();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    width: 280,
                    height: 200,
                    child: Image.asset('assets/imagens/imgtopapp.png'),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 30),
              height: 40,
              child: TextFormField(
                controller: this.controllerEmail,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  prefixIcon: Container(
                    transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                    child: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  labelText: "E-mail",
                  contentPadding: EdgeInsets.symmetric(vertical: -9),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    fontFamily: 'KGred',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(),
              height: 40,
              child: TextFormField(
                controller: this.controllerSenha,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  prefixIcon: Container(
                    transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                    child: Icon(
                      Icons.vpn_key,
                      color: Colors.black,
                    ),
                  ),
                  labelText: "Senha",
                  contentPadding: EdgeInsets.symmetric(vertical: -9),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    fontFamily: 'KGred',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Cadastro Cpa",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'KGred',
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ConfirmarCodigo()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 220,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amberAccent,
                        onPrimary: Colors.tealAccent[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      child: Text(
                        'Sou Cpa',
                        style: TextStyle(
                          fontFamily: 'KGred',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        validarCampos();
                      },
                    ),
                  ),
                ),
              ],
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 220,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 255, 255, 0.9),
                        onPrimary: Colors.teal[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      child: Text(
                        'Cadastro Cpa',
                        style: TextStyle(
                            fontFamily: 'KGred',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(238, 94, 84, 0.9)),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ConfirmarCodigo()));
                      },
                    ),
                  ),
                ),
              ],
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 25),
                    width: 220,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amberAccent,
                        onPrimary: Colors.teal[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      child: Text(
                        'Sou estudante',
                        style: TextStyle(
                            fontFamily: 'KGred',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ConfirmPage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
