import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class addCartBar extends StatefulWidget {
  const addCartBar({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  _addCartBarState createState() => _addCartBarState();
}

class _addCartBarState extends State<addCartBar> {
  void _addItem(BuildContext context, Product product) {
    Provider.of<UserCart>(context, listen: false).addItem(product);
  }

  @override
  Widget build(BuildContext context) {
    final userCart = Provider.of<UserCart>(context);
    return Container(
      height: 70,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 8,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.product.price.toStringAsFixed(2) + "TL",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.product.isFavourite = !widget.product.isFavourite;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: width * 0.1,
                    height: width * 0.1,
                    decoration: BoxDecoration(
                        color: SecondaryColor1.withOpacity(0.2),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.favorite,
                      color: widget.product.isFavourite
                          ? PrimaryColor
                          : SecondaryColor1.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                DefaultButton(
                  text: 'Sepete Ekle',
                  buttonWidth: 40,
                  textFontSize: 15,
                  press: () {
                    userCart.addItem(widget.product);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
