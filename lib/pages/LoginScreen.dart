import 'dart:io';

import 'package:flutter/material.dart';
import 'package:magentorx/pages/HomePage.dart';
import 'package:magentorx/utils/OAuthV1.dart';
import 'package:magentorx/utils/OAuthV2.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MagentoRx"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (val) => _username = val,
                style: TextStyle(debugLabel: "Username",color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (val) => _password = val,
                style: TextStyle(debugLabel: "Password",color: Colors.black),
              ),
            ),
            RaisedButton(
                onPressed: () => OAuth1(username: _username, password: _password).authorize(),
            )
          ],
        ),
      ),
    );
  }

  checkFile(File file)async{
    var fExist = await file.exists();
    if(fExist)
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
    else
      print("failed");
  }
}
