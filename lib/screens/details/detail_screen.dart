import 'package:e_commerce/components/default_appbar.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/add_cart_bar.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  static String routName = "/detailscreen";
  @override
  Widget build(BuildContext context) {
    final ProductDetailArgument arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailArgument;
    return Scaffold(
      extendBody: true,
      appBar: buildCustomAppBar(context: context),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Body(
            product: arguments.product,
            constraintsHeight: constraints.maxHeight,
          );
        },
      ),
      bottomNavigationBar: addCartBar(
        product: arguments.product,
      ),
    );
  }
}

class ProductDetailArgument {
  final Product product;
  ProductDetailArgument({required this.product});
}
