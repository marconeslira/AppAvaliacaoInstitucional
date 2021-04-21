import 'dart:ui';
import 'package:flutter/material.dart';

//import 'package:url_launcher/url_launcher.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 15),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/imagens/cadeado.png'),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: EdgeInsets.only(left: 5, right: 5),
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                height: 50,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45),
                width: 280,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    onPrimary: Colors.teal[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    //Navigator.of(context).push(
                    //    MaterialPageRoute(builder: (context) => PageLogin()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
