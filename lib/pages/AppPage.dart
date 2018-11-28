import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magentorx/model/Product.dart';
import 'package:magentorx/pages/HomePage.dart';
import 'package:magentorx/pages/LoginPage.dart';
import 'package:magentorx/utils/Theme.dart';
import 'package:magentorx/utils/api/GetProduct.dart';
import 'package:magentorx/utils/data/Data.dart';
import 'package:magentorx/widgets/CategoryMenu.dart';
import 'package:magentorx/widgets/BackDrop.dart';
import 'package:magentorx/model/Category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  CategoryModel _currentCategory;
  List<CategoryModel> _categoryList = new List();
  List<Product> _productList = new List();
  final Data _data = new Data();

  @override
  void initState() {
    super.initState();
    _gData();
  }

  _gData() async {
    _categoryList =
        await _data.getCategory().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JShop",
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: FutureBuilder(
            future: _data.getProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return HomePage(product: snapshot.data);
              } else {
                return Center(
                  child: Padding(padding: EdgeInsets.symmetric(horizontal:40.0),child: LinearProgressIndicator(),),
                );
              }
            }),
        backLayer: CategoryMenuPage(
          categories: _categoryList,
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('JShop'),
        backTitle: Text('MENU'),
      ),
      onGenerateRoute: _getRoute,
      theme: AppTheme.getTheme(),
    );
  }

  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(CategoryModel category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginPage(),
    fullscreenDialog: true,
  );
}
