// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:magentorx/model/Product.dart';
import 'product_columns.dart';

class AsymmetricView extends StatelessWidget {
  final List<Product> products;

  AsymmetricView({Key key, this.products});

  @override
  Widget build(BuildContext context) {
    return gridView();
  }

  Widget gridView() {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2.7/5),
        itemBuilder: (context, count) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: OneProductCardColumn(
                product: products[count],
              ),
            ),
          );
        });
  }
}
