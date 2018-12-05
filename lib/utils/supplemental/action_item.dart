import 'package:flutter/material.dart';
import 'package:magentorx/model/CartItem.dart';


Widget getCartButton(BuildContext context,CartItem _cart){
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
          _cart.itemQuantity == null || _cart.itemQuantity == 0
              ? new Container(child: Text(""),)
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
                            _cart.itemQuantity.toString(),
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )),
        ],
      ));
}
