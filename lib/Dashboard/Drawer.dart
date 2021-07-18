import 'package:flutter/material.dart';
import '../Home/PageInicial.dart';
import '../Usuarios/GerarCodigo.dart';
import '../Avaliacoes/FavoritasAvaliacoes.dart';
import '../Avaliacoes/listAvaliacoes.dart';
import 'PageDashboard.dart';
import '../Usuarios/editarPerfil.dart';
import '../Avaliacoes/listObservacoes.dart';
import 'sobre.dart';
import 'estatisticas.dart';

class CustomDrawer extends StatefulWidget {
  var nome;
  var razaoSocial;
  var email;
  var senha;
  var idUser;
  CustomDrawer(
      this.nome, this.razaoSocial, this.email, this.senha, this.idUser);
  @override
  _CustomDrawer createState() => _CustomDrawer();
}

class _CustomDrawer extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    var nomeUsuario = '${widget.nome}';
    var emailUsuario = '${widget.email}';
    var senhaUsuario = '${widget.senha}';
    var idUsuario = '${widget.idUser}';
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //perfil do usuario
          UserAccountsDrawerHeader(
            //nome do usuario
            //accountName: Text('Olá, ' + nomeUsuario,
            //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            //login do usuario
            /*accountEmail: Text('${widget.razaoSocial}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),*/
            //imagem de fundo
            decoration: BoxDecoration(
              color: Colors.teal,
              image: DecorationImage(
                image: ExactAssetImage('assets/imagens/logopolo.png'),
                fit: BoxFit.contain,
              ),
            ),
            //imagem do perfil do usuario
          ),

          //lista do menu Seu Perfil
          ListTile(
            //leading: Icon(Icons.person),
            title: Text(
              'Olá, ' + nomeUsuario,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ListTile(
            //leading: Icon(Icons.person),
            title: Text(
              "Editar perfil",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditarUsuario(
                          nomeUsuario, emailUsuario, senhaUsuario, idUsuario)));
            },
          ),

          //lista do menu Suas doações
          ListTile(
            // leading: Icon(Icons.favorite),
            title: Text(
              "Gerar código",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GerarCodigo()));
            },
          ),

          //lista do menu Termos de uso
          ListTile(
            //leading: Icon(Icons.article),
            title: Text(
              "Avaliações em destaque",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {
             
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => List_AvaliacoesFavoritas()));
            },
          ),
          ListTile(
            //leading: Icon(Icons.article),
            title: Text(
              "Avaliações em observação",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => List_Observacoes()));
            },
          ),

          //lista de creditos
          ListTile(
            //leading: Icon(Icons.article_outlined),
            title: Text(
              "Estatísticas",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Estatisticas()));
            },
          ),
          //lista de creditos
          ListTile(
            //leading: Icon(Icons.article_outlined),
            title: Text(
              "Sobre",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sobre()));
            },
          ),

          //lista de sair da Conta
          ListTile(
            //leading: Icon(Icons.exit_to_app),
            title: Text(
              "Sair",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PageInicial()));
            },
          ),
        ],
      ),
    );
  }
}
