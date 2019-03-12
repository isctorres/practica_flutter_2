import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}
 class LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {

    Future<String> getData() async {
      http.Response response = await http.get(
          Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
          headers: { "Accept" : "application/json"}
      );

      //print(response.body);

      List data = json.decode(response.body);
      print(data[1]["title"]);

    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        radius: 48.0,
        child: Image.asset("images/logo.png"),
      ),
    );

    final txtEmail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      //autofocus: false,
      decoration: InputDecoration(
        hintText: 'Introduce el e-mail',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final txtPwd = TextFormField(
      //autofocus: false,
      //initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Introduce el password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: getData,
        padding: EdgeInsets.all(12),
        color: Colors.lightGreen,
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 40.0),
            txtEmail,
            SizedBox(height: 30.0),
            txtPwd,
            SizedBox(height: 30.0),
            loginButton
          ],
        ),
      ),
    );
  }
 }