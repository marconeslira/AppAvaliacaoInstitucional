import 'dart:ui';
import 'package:flutter/material.dart';
import 'ConfirmPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    width: 280,
                    height: 370,
                    child: Image.asset('assets/imagens/imgtopapp.png'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 280,
                    height: 40,
                    child: RaisedButton(
                      child: Text(
                        'Sou Aluno',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ConfirmPage()));
                      },
                      //borderSide: BorderSide(width: 0.8),
                      color: Colors.amberAccent,
                      highlightColor: Colors.tealAccent[700],
                      //highlightedBorderColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 45),
                    width: 280,
                    height: 40,
                    child: RaisedButton(
                      child: Text(
                        'Sou da CPA',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        print("Butao");
                      },
                      //borderSide: BorderSide(width: 0.8),
                      color: Colors.amberAccent,
                      highlightColor: Colors.tealAccent[700],
                      //highlightedBorderColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'by: Marcones Lira',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
