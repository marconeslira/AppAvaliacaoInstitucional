import 'dart:ui';
import 'package:flutter/material.dart';
import '../Home/PageInicial.dart';
import 'dart:io';
import '../Home/Carregamento.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Estatisticas extends StatefulWidget {
  @override
  _Estatisticas createState() => _Estatisticas();
}

class _Estatisticas extends State<Estatisticas> {
  @override
  void initState() {
    // TODO: implement initState

    //Execução dos métodos de busca dos valores ao iniciar
    super.initState();
    this.listarAvalicaoesQuantidade();
    this.listarQuantidadeDestaques();
    this.listarQuantidadeObservacao();
    this.mediaAtendimento();
    this.mediaAgilidade();
    this.mediaAuxilioEstudantes();
    this.mediaTutores();
    this.mediaNotaCoordenacao();
  }

  var quantidadeRespostas = "0";
  int quantidadeRetorno;
  var quantidadeDestaques = "0";
  int quantidadeDestaquesRetorno;
  var quantidadeObservacao = "0";
  int quantidadeObservacaoRetorno;

  //Medias
  var retornoAtendimento;
  var atendimentoNota = "0";
  var retornoAgilidade;
  var agilidadeNota = "0";
  var retornoAuxilio;
  var auxilioNota = "0";
  var retornoTutores;
  var tutoresNota = "0";
  var retornoCoordenacao;
  var coordenacaoNota = "0";

  //Busca quantidade de avaliacoes
  listarAvalicaoesQuantidade() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Estatisticas/avaliacoes.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      this.quantidadeRetorno = jsonResponse;
    });

    this.quantidadeRespostas = "$quantidadeRetorno";
  }

  //Busca quantidade de avaliacoes em destaque
  listarQuantidadeDestaques() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Estatisticas/destaques.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      this.quantidadeDestaquesRetorno = jsonResponse;
    });

    this.quantidadeDestaques = "$quantidadeDestaquesRetorno";
  }

  //Busca quantidade de avaliacoes em observacao
  listarQuantidadeObservacao() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Estatisticas/obervacoes.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      this.quantidadeObservacaoRetorno = jsonResponse;
    });

    this.quantidadeObservacao = "$quantidadeObservacaoRetorno";
  }

  //Busca média geral dos atendimentos
  mediaAtendimento() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Estatisticas/mediaAtendimento.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      this.retornoAtendimento = jsonResponse;
    });

    if (this.retornoAtendimento == null) {
      this.atendimentoNota = "0";
    } else {
      this.atendimentoNota = this.retornoAtendimento;
    }
  }

  //Busca média geral da agilidade do atendimento
  mediaAgilidade() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Estatisticas/mediaAgilidade.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    
    setState(() {
      this.retornoAgilidade = jsonResponse;
    });

    if (this.retornoAgilidade == null) {
      this.agilidadeNota = "0";
    } else {
      this.agilidadeNota = this.retornoAgilidade;
    }
  }

  //Busca média geral do auxilio a estudantes
  mediaAuxilioEstudantes() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Estatisticas/mediaAuxilioEstudantes.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    
    setState(() {
      this.retornoAuxilio = jsonResponse;
    });

    if (this.retornoAuxilio == null) {
      this.auxilioNota = "0";
    } else {
      this.auxilioNota = this.retornoAuxilio;
    }
  }

  //Busca média geral dos tutores
  mediaTutores() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Estatisticas/mediaNotaTutores.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    
    setState(() {
      this.retornoTutores = jsonResponse;
    });

    if (this.retornoTutores == null) {
      this.tutoresNota = "0";
    } else {
      this.tutoresNota = this.retornoTutores;
    }
  }

  mediaNotaCoordenacao() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Estatisticas/mediaNotaCoordenacao.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    
    setState(() {
      this.retornoCoordenacao = jsonResponse;
    });

    if (this.retornoCoordenacao == null) {
      this.coordenacaoNota = "0";
    } else {
      this.coordenacaoNota = this.retornoCoordenacao;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Estatísticas',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.tealAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        'Quantidade de avaliações: ' + quantidadeRespostas,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        'Avaliações em destaque: ' + quantidadeDestaques,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        'Avaliações em observação: ' + quantidadeObservacao,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 5),
                  child: Text(
                    "Médias das avaliações: (de 0 a 3)",
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
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nota média de atendimento: ' + atendimentoNota,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nota média de agilidade: ' + agilidadeNota,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        'Nota média de auxílio ao estudante: ' + auxilioNota,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nota média tutores: ' + tutoresNota,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nota média coordenação: ' + coordenacaoNota,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
