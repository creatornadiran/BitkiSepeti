import 'package:e_commerce/screens/home/components/popular_products.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'categories.dart';
import 'home_header.dart';
import 'new_added.dart';
import 'offer_card_builder..dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          HomeHeader(),
          SizedBox(
            height: height * 0.03,
          ),
          offerCardBuilder(),
          SizedBox(
            height: height * 0.03,
          ),
          Categories(),
          SizedBox(
            height: height * 0.03,
          ),
          NewAdded(),
          SizedBox(
            height: height * 0.03,
          ),
          PopularProducts(),
        ],
      ),
    ));
  }
}
