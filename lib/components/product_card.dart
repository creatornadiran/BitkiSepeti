import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final GestureTapCallback press;
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: width * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: widget.press,
              child: Container(
                width: width * 0.3,
                height: width * 0.3,
                decoration: BoxDecoration(
                    color: SecondaryColor1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(widget.product.images[0]),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              widget.product.title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.price.toStringAsFixed(2) + "TL",
                  style: TextStyle(
                      color: TextColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
