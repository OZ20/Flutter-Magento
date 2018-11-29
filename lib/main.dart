import 'package:flutter/material.dart';
import 'package:magentorx/pages/AppPage.dart';

import 'package:magentorx/pages/HomePage.dart';
import 'package:magentorx/pages/LoginPage.dart';
import 'package:magentorx/pages/ProductDetailPage.dart';
import 'package:magentorx/utils/Theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      home: new AppPage(),
      routes: <String,WidgetBuilder>{
        "/login" : (context) => new LoginPage(),
        "/home" : (context) => new HomePage(),
        "/app" : (context) =>  new AppPage(),
        "/detail" : (context) => new ProductDetailPage(),
      },
    );
  }
}



