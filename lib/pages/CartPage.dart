import 'package:flutter/material.dart';
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/utils/api/GetCartITem.dart';
import 'package:magentorx/widgets/CartItem.dart';
import 'package:rxdart/rxdart.dart';

const List _cartList = ["Book", "Helmet", "Radio", "Teeth"];

class CartPage extends StatefulWidget {
  final token;

  CartPage({this.token});

  @override
  State createState() {
    return _CartPage();
  }
}

class _CartPage extends State<CartPage> {

  final PublishSubject<CartItem> _listItem = PublishSubject();
  bool isTokenValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: _listItem,
              builder: (context, AsyncSnapshot<CartItem> snapshot) {
                if (isTokenValid)
                  return Container(
                    height: 600.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.items.length,
                      itemBuilder: (context, count) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CartItemWidget(snapshot.data.items[count]),
                          ),
                    ),
                  );
                else
                  return Text("Please login to view cart");
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getCartItem();
  }

  void getCartItem() async {
    await GetCartItem().getCartItem().then((data) =>
    data["statuscode"] == 200 ? tokenIsValid(data) : isTokenValid = false);
  }

  void tokenIsValid(data) => _listItem.add(
      CartItem.fromJson(data));

  @override
  void dispose() {
    super.dispose();
    _listItem?.close();
  }
}
