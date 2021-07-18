import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'VizualizarAvaliacao.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '../Home/PageInicial.dart';

class List_Observacoes extends StatefulWidget {
  @override
  _List_Observacoes createState() => _List_Observacoes();
}

class _List_Observacoes extends State<List_Observacoes> {
  var nomeIes;
  var dados;
  var retorno;
  int contador;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    this.listarAvalicaoesObservacoes();
  }

  //Busca as avaliações na lista de observações
  listarAvalicaoesObservacoes() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Avaliacoes/listarObservacoes.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      this.dados = jsonResponse;
    });

    if (dados == "Falha") {
      this.contador = null;
      print(contador);
    } else {
      this.contador = this.dados.length;
      print(contador);
    }
  }

  removerFavoritar(var id) async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/Avaliacoes/removerObservacao.php?chave=avaies99');

    final res = await http.post(url, body: {
      "id": id,
    });

    final data = jsonDecode(res.body);

    if (data == "Sucesso") {
      Fluttertoast.showToast(
          msg: "Removido com sucesso!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20.0);
      listarAvalicaoesObservacoes();
    } else {
      Fluttertoast.showToast(
          msg: "Erro ao tentar favoritar",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Avaliações em observação',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.0),
        itemCount: this.contador != null ? this.contador : 0,
        itemBuilder: (context, index) {
          return InkWell(
            //card do anuncio
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(dados[index]['nomeCurso'] +
                        ' - Período: ' +
                        dados[index]['periodo']),
                    subtitle: Text(
                      dados[index]['data'],
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonMinWidth: 70,
                    children: [
                      /*FlatButton(
                        textColor: const Color.fromRGBO(0, 0, 0, 0.9),
                        color: Color.fromRGBO(255, 0, 0, 0.9),
                        padding: const EdgeInsets.all(16.0),
                        onPressed: () {
                          removerFavoritar(dados[index]['id']);
                        },
                        child: const Text(
                          'Remover',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),*/
                      FlatButton(
                        textColor: const Color.fromRGBO(0, 0, 0, 0.9),
                        color: Color.fromRGBO(0, 154, 255, 0.9),
                        padding: const EdgeInsets.all(16.0),
                        onPressed: () {
                          // Perform some action
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VizualizarAvaliacao(
                                      dados[index]['nomeCurso'],
                                      dados[index]['periodo'],
                                      dados[index]['data'],
                                      dados[index]['notaAtendimento'],
                                      dados[index]['notaAgilidade'],
                                      dados[index]['notaAuxilioEstudantes'],
                                      dados[index]['notaTutores'],
                                      dados[index]['notaApoioPedagogico'],
                                      dados[index]['notaCoordenacao'],
                                      dados[index]['notasEventos'],
                                      dados[index]['sugestoes'],
                                      dados[index]['pontosNegativos'],
                                      dados[index]['comentariosLivre'])));
                        },
                        child: const Text(
                          'Vizualizar',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
