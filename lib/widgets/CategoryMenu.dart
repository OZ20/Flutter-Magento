

import 'package:flutter/material.dart';
import 'package:magentorx/model/Category.dart';
import 'package:magentorx/model/productpast.dart';
import 'package:magentorx/utils/colour/colors.dart';
import 'package:meta/meta.dart';


class CategoryMenuPage extends StatelessWidget {
  final CategoryModel currentCategory;
  final ValueChanged<CategoryModel> onCategoryTap;
  final List<CategoryModel> categories;

  const CategoryMenuPage({
    Key key,
    @required this.categories,
    @required this.currentCategory,
    @required this.onCategoryTap,
  })
//      : assert(currentCategory != null),
//        assert(onCategoryTap != null)
 ;

  Widget _buildCategory(CategoryModel category, BuildContext context) {
    final categoryString = category.cName;
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory
          ? Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(
            categoryString,
            style: theme.textTheme.body2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.0),
          Container(
            width: 70.0,
            height: 2.0,
            color: kColorBlue400,
          ),
        ],
      )
          : Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          categoryString,
          style: theme.textTheme.body2.copyWith(
              color: kShrineSurfaceWhite.withAlpha(250)
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        color: kColorBlue,
        child: ListView(
            children: categories
                .map((CategoryModel c) => _buildCategory(c, context))
                .toList()),
      ),
    );
  }
}
