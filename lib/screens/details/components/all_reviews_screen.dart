import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/details/components/review_box.dart';
import 'package:flutter/material.dart';

class allReviews extends StatelessWidget {
  const allReviews({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Tüm Yorumlar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            height: height * 0.7,
            child: ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (BuildContext context, int index) {
                  return reviewBox(
                    index: index,
                    product: product,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: product.reviews!.length),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Geri Dön",
                style: TextStyle(color: PrimaryColor),
              ))
        ],
      ),
    );
  }
}
