import 'package:flutter/material.dart';
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/utils/pref/helper.dart';

Widget getCartButton(BuildContext context) {
  return Container(
      child: new Stack(
    children: <Widget>[
      new IconButton(
        icon: new Icon(
          Icons.shopping_cart,
          color: Colors.blue,
        ),
        onPressed: null,
      ),
      StreamBuilder(
          stream: Helper.cartItem,
          builder: (context, AsyncSnapshot<CartItem> snapshot) {
            return snapshot.hasData
                ? snapshot.data.itemQuantity == null ||
                        snapshot.data.itemQuantity == 0 ||
                        !Helper.isTokenValid
                    ? new Container(
                        child: Text(""),
                      )
                    : new Positioned(
                        child: new Stack(
                        children: <Widget>[
                          new Icon(Icons.brightness_1,
                              size: 21.0, color: Colors.green[800]),
                          new Positioned(
                              top: 3.0,
                              right: 7.0,
                              child: new Center(
                                child: new Text(
                                  snapshot.data.itemQuantity.toString(),
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      ))
                : new Container(
                    child: Text(""),
                  );
          })
    ],
  ));
}
