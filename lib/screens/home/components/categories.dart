import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List<String>> categories = [
      ["assets/icons/plant.svg", "Bitki"],
      ["assets/icons/sesame.svg", "Tohum"],
      ["assets/icons/sprout.svg", "Fidan"],
      ["assets/icons/tree.svg", "Ağaç"],
      ["assets/icons/vase.svg", "Saksı"],
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              categories.length,
              (index) => CategoryCard(
                  img: categories[index][0],
                  text: categories[index][1],
                  press: () {}))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.img, required this.text, required this.press})
      : super(key: key);
  final String text, img;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: width * 0.15,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.01),
              decoration: BoxDecoration(
                  color: SecondaryColor1.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15)),
              child: SvgPicture.asset(
                img,
                height: 50,
                width: 50,
                color: PrimaryColor,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
