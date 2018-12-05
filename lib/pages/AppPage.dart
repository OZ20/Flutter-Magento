
import 'package:flutter/material.dart';
import 'package:magentorx/model/Product.dart';
import 'package:magentorx/pages/HomePage.dart';
import 'package:magentorx/pages/LoginPage.dart';
import 'package:magentorx/utils/Theme.dart';
import 'package:magentorx/utils/data/Data.dart';
import 'package:magentorx/widgets/CategoryMenu.dart';
import 'package:magentorx/widgets/BackDrop.dart';
import 'package:magentorx/model/Category.dart';
import 'package:rxdart/rxdart.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  CategoryModel _currentCategory;
  List<CategoryModel> _categoryList = new List();

  final PublishSubject<List<Product>> _dataStream = new PublishSubject();
  final Data _data = new Data();

  bool _fetching = true;

  @override
  void initState() {
    super.initState();
    _gData();
    _getDataStream();
  }

  _gData() async {
    _categoryList =
        await _data.getCategory().whenComplete(() => setState(() {}));
  }

  _getDataStream({category}) async {
    var data = await _data
        .getProduct(category: category)
        .whenComplete(() => _fetching = false);
    _dataStream.sink.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JShop",
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: StreamBuilder(
            stream: _dataStream.stream,
            builder: (context, snapshot) {
              if (!_fetching && snapshot.hasData) {
                return HomePage(
                  product: snapshot.data,
                  category: _currentCategory,
                );
              } else {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: LinearProgressIndicator(),
                  ),
                );
              }
            }),
        backLayer: CategoryMenuPage(
          categories: _categoryList,
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
  void _onCategoryTap(CategoryModel category) {
    setState(() {
      _fetching = true;
      _currentCategory = category;
    });
    _getDataStream(category: category.id);
  }

  @override
  void dispose() {
    super.dispose();
    _dataStream?.close();
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
