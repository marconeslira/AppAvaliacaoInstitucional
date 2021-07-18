import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'VizualizarAvaliacao.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class List_AvaliacoesFavoritas extends StatefulWidget {
  @override
  _List_AvaliacoesFavoritas createState() => _List_AvaliacoesFavoritas();
}

class _List_AvaliacoesFavoritas extends State<List_AvaliacoesFavoritas> {
  
  var nomeIes;
  var dados;
  var retorno;
  int contador;

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
   
    this.listarAvalicaoesFavoritas();
  }

  //Busca as avaliações favoritas
  listarAvalicaoesFavoritas() async {
    final url = Uri.parse(
        "https://avaliacaoinstitucional.000webhostapp.com/Retorno/Avaliacoes/listarFavoritas.php?chave=avaies99");

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

  //Remover itens da lista de favoritos
  removerFavoritar(var id) async {
    final url = Uri.parse(
        'https://avaliacaoinstitucional.000webhostapp.com/Retorno/Avaliacoes/removerFavorita.php?chave=avaies99');

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
      listarAvalicaoesFavoritas();
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
          'Avaliações em destaque',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.0),
        //Aqui é verificado o comprimento da variavel contador, que setamos lá no metodo listarAvalicaoesFavoritas()
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
                          // Perform some action
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
