

import 'package:flutter/material.dart';
import 'package:magentorx/model/productpast.dart';
import 'package:magentorx/model/products_repository.dart';
import 'package:magentorx/utils/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category: Category.all});

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: ProductsRepository.loadProducts(category));
  }
}