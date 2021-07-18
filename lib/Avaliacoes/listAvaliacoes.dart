import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'VizualizarAvaliacao.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class List_Avaliacoes extends StatefulWidget {
  var faculdade;
  List_Avaliacoes(this.faculdade);
  @override
  _List_Avaliacoes createState() => _List_Avaliacoes();
}

class _List_Avaliacoes extends State<List_Avaliacoes> {
  var nomeIes;
  var dados;
  var retorno;
  int contador;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    this.listarAvalicaoes();
  }

  //Busca as avaliações
  listarAvalicaoes() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Avaliacoes/listar.php?chave=avaies99");

    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      this.dados = jsonResponse;
    });

    //Caso não haja nenhuma avalição na lista, atribui o valor de null ao contador do lenght da lista
    if (dados == "Falha") {
      this.contador = null;
      print(contador);
    } else {
      this.contador = this.dados.length;
      print(contador);
    }
  }

  //Incluí uma avaliação na lista de destaques
  favoritar(var id) async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/Avaliacoes/favoritar.php?chave=avaies99');

    final res = await http.post(url, body: {
      "id": id,
    });

    final data = jsonDecode(res.body);

    if (data == "Sucesso") {
      Fluttertoast.showToast(
          msg: "Adicionado aos destaques",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.teal,
          textColor: Colors.white,
          fontSize: 15.0);
      listarAvalicaoes();
    } else {
      Fluttertoast.showToast(
          msg: "Erro ao tentar favoritar",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  //Incluí uma avaliação na lista de observações
  observacao(var id) async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/Avaliacoes/observacao.php?chave=avaies99');

    final res = await http.post(url, body: {
      "id": id,
    });

    final data = jsonDecode(res.body);

    if (data == "Sucesso") {
      Fluttertoast.showToast(
          msg: "Adicionado ao painel de observação",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.teal,
          textColor: Colors.white,
          fontSize: 15.0);
      listarAvalicaoes();
    } else {
      Fluttertoast.showToast(
          msg: "Erro ao tentar favoritar",
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
      appBar: AppBar(
        title:
            Text('Novas avaliações: ', style: TextStyle(color: Colors.black)),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
        bottomOpacity: 6,
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            //atualiza a lista
            onPressed: () {
              listarAvalicaoes();
            },
            icon: Icon(
              Icons.refresh,
              color: Color(0xfff48d8a),
            ),
            label: Text(
              'Atualizar',
              style: TextStyle(
                fontFamily: 'KGred',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xfff48d8a),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.0),
        itemCount: this.contador != null ? this.contador : 0,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              listarAvalicaoes();
            },
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
                      if (dados[index]['favorita'] == 'Nao')
                        FlatButton(
                          textColor: const Color.fromRGBO(0, 0, 0, 0.9),
                          color: Color.fromRGBO(0, 128, 128, 0.9),
                          padding: const EdgeInsets.all(16.0),
                          onPressed: () {
                            // Perform some action
                            favoritar(dados[index]['id']);
                          },
                          child: const Text(
                            'Destaque',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      if (dados[index]['painelObservacao'] == 'Nao')
                        FlatButton(
                          textColor: const Color.fromRGBO(0, 0, 0, 0.9),
                          color: Color.fromRGBO(255, 0, 0, 0.9),
                          padding: const EdgeInsets.all(16.0),
                          onPressed: () {
                            // Perform some action
                            observacao(dados[index]['id']);
                          },
                          child: const Text(
                            'Observação',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      FlatButton(
                        textColor: const Color.fromRGBO(0, 0, 0, 0.9),
                        color: Color.fromRGBO(0, 154, 255, 0.9),
                        padding: const EdgeInsets.all(16.0),
                        onPressed: () {
                          // Perform some action
                          //Passar dados e abrir a tela de vizualição de avaliações
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
