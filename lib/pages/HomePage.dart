import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magentorx/model/Category.dart';
import 'package:magentorx/model/Product.dart';
import 'package:magentorx/pages/CartPage.dart';
import 'package:magentorx/utils/supplemental/asymmetric_view.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<BottomNavigationBarItem> _items = [
  BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.blue,
      ),
      title: Text(
        "Home",
        style: TextStyle(color: Colors.blue),
      )),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.blue,
      ),
      title: Text(
        "Cart",
        style: TextStyle(color: Colors.blue),
      )),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
        color: Colors.blue,
      ),
      title: Text(
        "Account",
        style: TextStyle(color: Colors.blue),
      ))
];

class HomePage extends StatefulWidget {
  final CategoryModel category;
  final List<Product> product;

  const HomePage({this.category, this.product});

  @override
  State createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  PageController _controller = PageController();

  String _token;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _getToken();

  }

  _getToken() => _pref.then((pref) => _token = pref.get("TOKEN"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
          controller: _controller,
          children: <Widget>[
            AsymmetricView(
              products: widget.product,
            ),
            Container(
              child: CartPage(
                token: _token,
              ),
            ),
            Container(
              child: Center(
                child: Text("Account"),
              ),
            )
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (_changePage),
      ),
    );
  }

  void _changePage(index) {
    setState(() {
      _currentIndex = index;
      _controller.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
