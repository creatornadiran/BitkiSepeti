import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemCounterButton extends StatelessWidget {
  const ItemCounterButton(
      {Key? key, required this.svgSrc, this.numOfItem = 0, required this.press})
      : super(key: key);
  final String svgSrc;
  final int numOfItem;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(width * 0.01),
            height: width * 0.05,
            width: 0.05,
            decoration:
                BoxDecoration(color: SecondaryColor1, shape: BoxShape.circle),
            child: SvgPicture.asset(svgSrc),
          ),
        ],
      ),
    );
  }
}
