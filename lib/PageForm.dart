import 'package:avaliacao_institucional/PageAgradecimento.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Avaliação Institucional 2021.1',
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
                        'Preencha e Avalie os Itens a Seguir',
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
                    decoration: InputDecoration(
                      labelText: 'Nome da IES',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome do Curso',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Período / Módulo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          print("rating value -> $value");
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
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          print("rating value -> $value");
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
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          print("rating value -> $value");
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
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          print("rating value -> $value");
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
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          print("rating value -> $value");
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
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          print("rating value -> $value");
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
                        starCount: 3,
                        color: Colors.amber[600],
                        onRated: (value) {
                          print("rating value -> $value");
                        },
                        spacing: 15,
                        allowHalfRating: false,
                      ),
                    ),
                    //8
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 90,
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: '8 - Sugestões de Melhorias',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    //9
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 90,
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: '9 - Identifique 2 Pontos Negativos',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    //10
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 90,
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: '10 - Algum Comentário Livre?',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amberAccent,
                          onPrimary: Colors.tealAccent[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Text(
                          'Enviar',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => PageAgradecimento()));
                        },
                      ),
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
