import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.height,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'BitkiSepeti',
          style: TextStyle(
              fontSize: height * 0.05,
              color: PrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 0.1 * height,
        ),
        Container(
          width: 0.4 * height,
          height: 0.5 * height,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
            borderRadius: BorderRadius.all(Radius.circular(0.02 * height)),
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}
