

import 'package:flutter/material.dart';
import 'package:magentorx/model/Category.dart';
import 'package:magentorx/model/Product.dart';
import 'package:magentorx/utils/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final CategoryModel category;
  final List<Product> product;

  const HomePage({this.category,this.product});

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: product);
  }
}