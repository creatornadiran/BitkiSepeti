import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class reviewBox extends StatelessWidget {
  const reviewBox({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.reviews![index].username,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Row(
                children: [
                  Text(
                    "${product.reviews![index].rating}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Icon(Icons.star_rounded)
                ],
              )
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(product.reviews![index].review),
        ],
      ),
    );
  }
}
