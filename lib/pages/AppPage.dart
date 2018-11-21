

import 'package:flutter/material.dart';
import 'package:magentorx/model/product.dart';
import 'package:magentorx/pages/HomePage.dart';
import 'package:magentorx/pages/LoginPage.dart';
import 'package:magentorx/utils/Theme.dart';
import 'package:magentorx/widgets/CategoryMenu.dart';
import 'package:magentorx/widgets/BackDrop.dart';



class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  Category _currentCategory = Category.all;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JShop",
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(category: _currentCategory),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('JShop'),
        backTitle: Text('MENU'),
      ),
      onGenerateRoute: _getRoute,
      theme: AppTheme.getTheme(),
    );
  }

  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginPage(),
    fullscreenDialog: true,
  );
}
