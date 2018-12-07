import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/model/ShippingMethod.dart';
import 'package:magentorx/utils/api/CartManagement.dart';
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
  Timer timer;
  Size size;

  double price = 0.0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder(
        stream: Helper.cartItem.stream,
        builder: (context, AsyncSnapshot<CartItem> snapshot) {
          if (Helper.isTokenValid && snapshot.hasData) {
            CartManagement().estimateShippingMethods(
                customer: snapshot.data.customer, index: 0);
            CartManagement()
                .setShippingAndBillingInfo(cart: snapshot.data, index: 0)
                .then((data) => print(data.response));
            price = getSubTotal();
            print(price);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _shippingMethod(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: size.width,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.itemCount,
                          itemBuilder: (context, count) =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                CartItemWidget(snapshot.data.items[count]),
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      _coupon(),
                      SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (timer.isActive)
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: LinearProgressIndicator(),
              ),
            );
          else if (!Helper.isTokenValid)
            return Center(child: Text("Please login to view cart"));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//              _checkout()
            ],
          ),
        ),
      ),
    );
  }

  Widget _shippingMethod() {
    return StreamBuilder(
      stream: Helper.shippingMethod.stream,
      builder: (context, AsyncSnapshot<List<ShippingMethod>> snapshot) {
        return snapshot.hasData
            ? Container(
          height: 80.0,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) =>
                  FlatButton(
                      onPressed: () {},
                      child: Text(snapshot.data[index].carrierCode + " " + snapshot.data[index].methodCode))),
        )
            : Container();
      },
    );
  }

  Widget _coupon() {
    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration(hintText: "Enter Coupon Code"),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            FlatButton(onPressed: () {}, child: Text("APPLY")),
          ],
        ),
      ),
    );
  }

//  Widget _checkout() {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        Text("Subtotal: "),
//        cartItem != null ? Text("RM: " + price.toString()) : Text(""),
//        SizedBox(
//          width: 20.0,
//        ),
//        RaisedButton(
//          onPressed: () {},
//          child: Text("Checkout"),
//        )
//      ],
//    );
//  }

  double getSubTotal() {
    var currentPrice = 0.0;

    return currentPrice;
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(
        Duration(seconds: 2), () => this.mounted ? setState(() {}) : print);
    _token = Helper.token.listen((data) => print(data));
  }

  @override
  void dispose() {
    super.dispose();
    _token.cancel();
  }
}
