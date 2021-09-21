import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Container(
        margin: EdgeInsetsDirectional.all(height * 0.01),
        padding: EdgeInsetsDirectional.all(height * 0.01),
        height: height * 0.05,
        width: width * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEEEBF0), Colors.white]),
          //color: Color(0xFFEEEBF0),
          //border: Border.all(color: PrimaryColor),
          shape: BoxShape.rectangle,
        ),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
