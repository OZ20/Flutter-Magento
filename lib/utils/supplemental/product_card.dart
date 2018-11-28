
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magentorx/model/Product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  ProductCard({this.imageAspectRatio: 33 / 49, this.product})
      : assert(imageAspectRatio == null || imageAspectRatio > 0);

  final double imageAspectRatio;
  final Product product;
  final imageUri = "http://magento.jomsoft.com/pub/media/catalog/product";

  static final kTextBoxHeight = 65.0;

  String customAttribute(){
    var lists = product.customAttributes.map((attribute) => {
      attribute.attributeCode:attribute.value
    }).toList();
    print(lists[0]["image"]);
    String value = imageUri+lists[0]["image"];
    return value;
  }

  @override
  Widget build(BuildContext context) {
    customAttribute();
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    final ThemeData theme = Theme.of(context);

    Widget imageWidget = CachedNetworkImage(
      imageUrl:customAttribute(),
      fit: BoxFit.contain,
    );

    return InkWell(
      onTap: (){},
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: imageAspectRatio,
              child: imageWidget,
            ),
            SizedBox(
              height: kTextBoxHeight * MediaQuery.of(context).textScaleFactor,
              width: 121.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // TODO(larche): Make headline6 when available
                  Text(
                    product == null ? '' : product.name,
                    style: theme.textTheme.button,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4.0),
                  // TODO(larche): Make subtitle2 when available
                  Text(
                    product == null ? '' : formatter.format(product.price),
                    style: theme.textTheme.caption,
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
