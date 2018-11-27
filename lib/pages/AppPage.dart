import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magentorx/model/Product.dart';
import 'package:magentorx/model/productpast.dart';
import 'package:magentorx/pages/HomePage.dart';
import 'package:magentorx/pages/LoginPage.dart';
import 'package:magentorx/utils/Theme.dart';
import 'package:magentorx/utils/api/GetProduct.dart';
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
  List<CategoryModel> _categoryList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.get("TOKEN");
    GetProduct(token: token).getCategories().then((res) => _handleCategory(CategoryModel.fromJson(res)));
    GetProduct(token: token).getProduct().then((res) => res["items"]).then((item) => item.forEach((data) => _handleProduct(Product.fromJson(data))));
  }

  _handleCategory(CategoryModel model){
//    print(model.cName);
//    model.childrenData.forEach((data) {
//      if(data.childrenData.isNotEmpty){
//        _handleCategory(data);
//      }else
//        print(" " + data.cName);
//    });
    setState(() {
      _categoryList = model.childrenData;
    });
   return model.childrenData.forEach((category) => print(category.cName));
  }

  _handleProduct(Product product){
    print(product.name + " " + product.sku );
    product.customAttributes.forEach((data){
      if(data.attributeCode == "image")
        print(data.value);
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JShop",
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(),
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
