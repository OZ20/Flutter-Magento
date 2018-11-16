

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget{


  @override
  State createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Succesfully Login"),
          ],
        ),
      ),
    );
  }
}