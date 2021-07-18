//import 'package:avaliacao_institucional/PageAgradecimento.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'PageAgradecimento.dart';

class VizualizarAvaliacao extends StatefulWidget {
  var faculdade;
  var disciplina;
  var periodo;
  var idAvaliacao;
  var dataAvaliacao;
  var notaAtendimento;
  var notaAgilidade;
  var notaAuxilioEstudantes;
  var notaTutores;
  var notaApoioPedagogico;
  var notaCoordenacao;
  var notasEventos;
  var sugestoes;
  var pontosNegativos;
  var comentariosLivre;

  VizualizarAvaliacao(
      this.disciplina,
      this.periodo,
      this.dataAvaliacao,
      this.notaAtendimento,
      this.notaAgilidade,
      this.notaAuxilioEstudantes,
      this.notaTutores,
      this.notaApoioPedagogico,
      this.notaCoordenacao,
      this.notasEventos,
      this.sugestoes,
      this.pontosNegativos,
      this.comentariosLivre);
  @override
  _VizualizarAvaliacao createState() => _VizualizarAvaliacao();
}

class _VizualizarAvaliacao extends State<VizualizarAvaliacao> {
  //Controller para capturar os dados
  TextEditingController controllerNomeIES = TextEditingController();
  TextEditingController controllerNomeCurso = TextEditingController();
  TextEditingController controllerPeriodo = TextEditingController();
  TextEditingController controllerSugestoes = TextEditingController();
  TextEditingController controllerPontosNegativos = TextEditingController();
  TextEditingController controllerComentariosLivre = TextEditingController();

  //Estrelas
  double NotaAtendimentoAdministrativo;
  double NotaAgilidade;
  double NotaAuxilioEstudantes;
  double NotaTutores;
  double NotaApoioPedagogico;
  double NotaCoordenacao;
  double NotasEventos;

  @override
  Widget build(BuildContext context) {
    var disciplina;
    //Conversões dos valores de nota (Os valores vem como string da tela anterior)
    var atendimento = double.parse('${widget.notaAtendimento}');
    var agilidade = double.parse('${widget.notaAgilidade}');
    var auxilio = double.parse('${widget.notaAuxilioEstudantes}');
    var tutores = double.parse('${widget.notaTutores}');
    var pedagogico = double.parse('${widget.notaApoioPedagogico}');
    var coordenacao = double.parse('${widget.notaCoordenacao}');
    var eventos = double.parse('${widget.notasEventos}');
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          '${widget.disciplina}' + ' - ' + '${widget.periodo}',
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
                        'Respondido em - ' + '${widget.dataAvaliacao}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      height: 40,
                      child: Text(
                        'Nome curso: ' + '${widget.disciplina}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      height: 40,
                      child: Text(
                        'Período / Módulo : ' + '${widget.periodo}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      height: 40,
                      child: Text(
                        'Notas: ',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "1 - Atendimento Administrativo",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20),
                      alignment: Alignment.centerLeft,
                      child: SmoothStarRating(
                        rating: atendimento,
                        isReadOnly: true,
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          //print("rating value -> $value");
                          NotaAtendimentoAdministrativo = value;
                        },
                        spacing: 15,
                        allowHalfRating: false,
                      ),
                    ),
                    //2
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "2 - Agilidade na Resolução dos Processos",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20),
                      alignment: Alignment.centerLeft,
                      child: SmoothStarRating(
                        rating: agilidade,
                        isReadOnly: true,
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          NotaAtendimentoAdministrativo = value;
                        },
                        spacing: 15,
                        allowHalfRating: false,
                      ),
                    ),
                    //3
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "3 - Auxílio e Suporte aos Estudantes",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20),
                      alignment: Alignment.centerLeft,
                      child: SmoothStarRating(
                        rating: auxilio,
                        isReadOnly: true,
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          NotaAtendimentoAdministrativo = value;
                        },
                        spacing: 15,
                        allowHalfRating: false,
                      ),
                    ),
                    //4
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "4 - Atendimento dos Tutores Presenciais",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20),
                      alignment: Alignment.centerLeft,
                      child: SmoothStarRating(
                        rating: tutores,
                        isReadOnly: true,
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          NotaAtendimentoAdministrativo = value;
                        },
                        spacing: 15,
                        allowHalfRating: false,
                      ),
                    ),
                    //5
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "5 - Apoio Pedagógico",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20),
                      alignment: Alignment.centerLeft,
                      child: SmoothStarRating(
                        rating: pedagogico,
                        isReadOnly: true,
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          NotaAtendimentoAdministrativo = value;
                        },
                        spacing: 15,
                        allowHalfRating: false,
                      ),
                    ),
                    //6
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "6 - Coordenação do Polo",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20),
                      alignment: Alignment.centerLeft,
                      child: SmoothStarRating(
                        rating: coordenacao,
                        isReadOnly: true,
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          NotaAtendimentoAdministrativo = value;
                        },
                        spacing: 15,
                        allowHalfRating: false,
                      ),
                    ),
                    //7
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "7 - Eventos e estímulo a continuidade acadêmica",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20),
                      alignment: Alignment.centerLeft,
                      child: SmoothStarRating(
                        rating: eventos,
                        isReadOnly: true,
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          NotaAtendimentoAdministrativo = value;
                        },
                        spacing: 15,
                        allowHalfRating: false,
                      ),
                    ),
                    //8
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          height: 40,
                          child: Text(
                            'Sugestões de Melhorias: ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text('${widget.sugestoes}',
                                  style: Theme.of(context).textTheme.subhead),
                            ],
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          child: Text(
                            'Pontos negativos:',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text('${widget.pontosNegativos}',
                                  style: Theme.of(context).textTheme.subhead),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 40,
                          child: Text(
                            'Comentário Livre: ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text('${widget.comentariosLivre}',
                                  style: Theme.of(context).textTheme.subhead),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextButton(
                child: Text(
                  'www.polouabpalmares.ml',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
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
