import 'package:flutter/material.dart';
import 'package:magentorx/model/CartItem.dart';
import 'package:magentorx/model/Category.dart';
import 'package:magentorx/model/Product.dart';
import 'package:magentorx/pages/CartPage.dart';
import 'package:magentorx/pages/ProfilePage.dart';
import 'package:magentorx/utils/api/GetCartITem.dart';
import 'package:magentorx/utils/api/GetProfile.dart';
import 'package:magentorx/utils/pref/helper.dart';
import 'package:magentorx/utils/supplemental/asymmetric_view.dart';
import 'package:magentorx/utils/supplemental/action_item.dart';

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
  PageController _controller = PageController();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    GetProfile().getProfile();
    GetCartItem().getCartItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(controller: _controller, children: <Widget>[
        AsymmetricView(
          products: widget.product,
        ),
        Container(
          child: CartPage(),
        ),
        Container(
          child: Center(
            child: ProfilePage()
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
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
              icon: getCartButton(context),
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
        ],
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
    Helper.close();
    print("disposed");
  }

}
