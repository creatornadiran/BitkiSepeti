import 'package:e_commerce/components/default_appbar.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/cart/payment_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final userCart = Provider.of<UserCart>(context);
    return Scaffold(
        bottomNavigationBar: PaymentBar(),
        appBar: buildCustomAppBar(
            context: context,
            title: "Sepetiniz",
            numOfItems: userCart.NumberOfItems()),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      ...generateListFromMap(
                          userCart.products_in_cart, buildCartItemBox, userCart)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

List<Widget> generateListFromMap(
    Map<Product, int> map, Function builder, UserCart userCart) {
  List<Widget> widgetList = [];
  map.forEach((key, value) {
    widgetList.add(builder(key, userCart));
  });
  return widgetList;
}

Padding buildCartItemBox(Product key, UserCart userCart) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      height: height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              height: height * 0.15,
              width: height * 0.15,
              child: Image.asset(
                key.images[0],
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      key.title,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      key.price.toStringAsFixed(2) + "TL",
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: key.colors.length == 0
                          ? null
                          : Row(
                              children: [
                                Text("Color: "),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: Icon(
                                    Icons.circle,
                                    color: key.colors[0],
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          userCart.addItem(key);
                        },
                        child: Container(
                          child: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: PrimaryColor,
                            size: height * 0.05,
                          ),
                        )),
                    Container(
                      child: Text(
                        "${userCart.products_in_cart[key]}",
                        style: TextStyle(fontSize: height * 0.03),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          userCart.deleteItem(key);
                        },
                        child: Container(
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: PrimaryColor,
                            size: height * 0.05,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
