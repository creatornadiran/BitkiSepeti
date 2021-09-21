import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/details/detail_screen.dart';
import 'package:e_commerce/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Çok Satanlar", press: () {}),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  products.length,
                  (index) {
                    if (products[index].isPopular)
                      return ProductCard(
                        product: products[index],
                        press: () {
                          Navigator.pushNamed(context, DetailScreen.routName,
                              arguments: ProductDetailArgument(
                                  product: products[index]));
                        },
                      );
                    return SizedBox.shrink();
                  },
                )
              ],
            )),
      ],
    );
  }
}
