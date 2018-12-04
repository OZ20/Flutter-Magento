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
                      itemCount: snapshot.data.items?.length ?? 0,
                      itemBuilder: (context, count) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CartItemWidget(snapshot.data.items[count]),
                          ),
                    ),
                  );
                else if (!snapshot.hasData)
                  return Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: LinearProgressIndicator(),
                  ));
                else
                  return Center(child: Text("Please login to view cart"));
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
    _listItem.listen((onData) => isTokenValid = true);
  }

  void getCartItem() async {
    await GetCartItem().getCartItem().then((data) => data["statuscode"] == 200
        ? _listItem.add(CartItem.fromJson(data["response"]))
        : isTokenValid = false);
  }

  @override
  void dispose() {
    super.dispose();
    _listItem?.close();
  }
}
