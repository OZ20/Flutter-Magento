import 'package:flutter/material.dart';
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/utils/api/CartManagement.dart';
import 'package:magentorx/widgets/SwipeWidget.dart';

class CartItemWidget extends StatelessWidget {
  final Items item;


  CartItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return OnSlide(
      child: new Container(
        padding: const EdgeInsets.only(top: 10.0),
        width: size.width,
        height: 80.0,
        child: new Card(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: new Text(item.name)),
              Center(child: new Text(item.quantity.toString()),)
            ],
          ),
        ),
      ),
      items: [
        new ActionItems(icon: new IconButton(
          icon: new Icon(Icons.delete), onPressed: () {}, color: Colors.red,
        ), onPress: () => CartManagement().removeFromCart(itemId: item.itemId), backgroudColor: Colors.white),
        new ActionItems(icon: new IconButton(
          icon: new Icon(Icons.save), onPressed: () {}, color: Colors.blue,
        ), onPress: () {}, backgroudColor: Colors.white),
      ],
    );
  }
}
