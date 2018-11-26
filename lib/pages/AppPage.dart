import 'package:flutter/material.dart';
import 'package:magentorx/model/product.dart';
import 'package:magentorx/pages/HomePage.dart';
import 'package:magentorx/pages/LoginPage.dart';
import 'package:magentorx/utils/Theme.dart';
import 'package:magentorx/utils/api/GetProduct.dart';
import 'package:magentorx/widgets/CategoryMenu.dart';
import 'package:magentorx/widgets/BackDrop.dart';
import 'package:magentorx/model/Category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  Category _currentCategory = Category.all;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.get("TOKEN");
    GetProduct(token: token).getCategories().then((res) => CategoryModel.fromJson(res)).then((data) => data.childrenData.forEach(_handleChild));
    GetProduct(token: token).getProduct().then((res) => print(res));
  }

  _handleChild(CategoryModel data){
    if(data.childrenData.isNotEmpty){
      print(data.cName);
      print(data.level);
      data.childrenData.forEach((model) {
        if(model.childrenData.isNotEmpty){
          print(data.cName);
          print(data.level);
          _handleChild(model);
        }else{
          print(model.cName);
          print(data.level);
        }
      });
    }else {
      print(data.cName);
      print(data.level);
    }
  }

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

  @override
  void dispose() {
    super.dispose();
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
