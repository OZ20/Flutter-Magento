import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/utils/api/GetCartITem.dart';
import 'package:magentorx/utils/pref/helper.dart';
import 'package:magentorx/widgets/CartItem.dart';


class CartPage extends StatefulWidget {

  CartPage();

  @override
  State createState() {
    return _CartPage();
  }
}

class _CartPage extends State<CartPage> {
  StreamSubscription _token;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: Helper.cartItem.stream,
              builder: (context, AsyncSnapshot<CartItem> snapshot) {
                if (Helper.isTokenValid && snapshot.hasData)
                  return Container(
                    height: 600.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.itemCount,
                      itemBuilder: (context, count) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CartItemWidget(snapshot.data.items[count]),
                          ),
                    ),
                  );
                else
                  return snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: LinearProgressIndicator(),
                          ),
                        )
                      : Center(child: Text("Please login to view cart"));
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
    GetCartItem().getCartItem();
    _token = Helper.token.listen((data) => print(data));
  }



  @override
  void dispose() {
    super.dispose();
    _token.cancel();
  }
}
