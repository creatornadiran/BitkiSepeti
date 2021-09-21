import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'counter_icon_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userCart = Provider.of<UserCart>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  width: width * 0.65,
                  decoration: BoxDecoration(
                      color: SecondaryColor1.withOpacity(0.2),
                      //border: Border.all(color: SecondaryColor1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextField(
                      onChanged: (value) => print(value),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.01),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Kategori veya bitki ara",
                        prefixIcon: Icon(
                          Icons.search,
                          color: PrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                      iconSize: 25,
                      onPressed: () {
                        //Image Classification
                      },
                      icon: Icon(Icons.camera)),
                ),
              ],
            ),
            CounterIconButton(
              width: width,
              icon: Icons.shopping_cart,
              num: userCart.NumberOfItems(),
              press: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
            CounterIconButton(
              width: width,
              num: 1,
              icon: Icons.notifications,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
