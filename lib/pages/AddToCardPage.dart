
import 'package:flutter/material.dart';
import 'package:magentorx/widgets/CartItem.dart';

const List _cartList = ["Book","Helmet","Radio","Teeth"];

class AddToCartPage extends StatefulWidget{
  final token;

  AddToCartPage({this.token});

  @override
  State createState() {
    return _AddToCartPage();
  }
}

class _AddToCartPage extends State<AddToCartPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 600.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _cartList.length,
                itemBuilder: (context,count) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CartItem(_cartList[count]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}