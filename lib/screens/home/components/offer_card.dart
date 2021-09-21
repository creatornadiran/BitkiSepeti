import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constants.dart';

class offerCard extends StatelessWidget {
  offerCard.discountCard(
    this.category,
    this.discount,
  );
  offerCard.textCard(this.text) {
    isText = true;
  }
  offerCard.imageCard(this.img) {
    isImage = true;
  }
  String? category, img, discount, text;
  late bool isText = false;
  late bool isImage = false;
  List<Color> colors = [
    Colors.deepOrange,
    Colors.red,
    Colors.blueAccent,
  ];

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    return GestureDetector(
      onTap: () {
        //Indirimli kategoriye yönlendir
      },
      child: Container(
          margin: EdgeInsets.all(8),
          width: width / 3,
          height: 90,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: isText
                ? buidTextCard(text!)
                : isImage
                    ? buildImageCard(img!)
                    : buildDiscountCard(discount!, colors, rng, category!),
          )),
    );
  }

  Image buildImageCard(String img) {
    return Image.asset(img);
  }

  Text buidTextCard(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    );
  }

  Column buildDiscountCard(
      String discount, List<Color> colors, Random rng, String category) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          category,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          "%" + discount,
          style: TextStyle(
              fontSize: 25,
              color: colors[rng.nextInt(colors.length)],
              fontWeight: FontWeight.bold),
        ),
        Text(
          "indirim!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
