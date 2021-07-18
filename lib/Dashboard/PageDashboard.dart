import 'dart:ui';
import '../Home/PageInicial.dart';
import 'package:flutter/material.dart';
import '../Avaliacoes/ConfirmPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '../Avaliacoes/listAvaliacoes.dart';
import 'Drawer.dart';
import 'estatisticas.dart';
import '../Home/PageInicial.dart';

class PageDashboard extends StatefulWidget {
  String email;
  String nome;
  String razaoSocial;
  String senha;
  var idUsuario;
  var DadosAtividades;

  //Recebe os dados que são passados da tela anterior
  PageDashboard(this.email, this.nome, this.razaoSocial, this.DadosAtividades,
      this.senha, this.idUsuario);

  @override
  _PageDashboardState createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {
  @override
  Widget build(BuildContext context) {
    String nomeFaculdade = "${widget.razaoSocial}";
    String nomeUser = "${widget.nome}";
    String emailUser = "${widget.email}";
    String senhaUser = "${widget.senha}";
    String idUser = "${widget.idUsuario}";
    var dadosAt = '${widget.DadosAtividades}';
    //print(dadosAt);
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dashboard'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.teal,
      ),

      //Drawer
      drawer:
          CustomDrawer(nomeUser, nomeFaculdade, emailUser, senhaUser, idUser),

      //Lista das avaliações
      body: List_Avaliacoes(nomeFaculdade),
    );
  }
}
