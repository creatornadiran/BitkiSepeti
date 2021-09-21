import 'package:flutter/material.dart';

import '../../../constants.dart';

class CounterIconButton extends StatelessWidget {
  const CounterIconButton({
    Key? key,
    required this.width,
    required this.icon,
    this.num = 0,
    required this.press,
  }) : super(key: key);
  final IconData icon;
  final int num;
  final GestureTapCallback press;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(110),
      child: Stack(
        children: [
          Container(
            height: width * 0.1,
            width: width * 0.1,
            child: Icon(
              icon,
              color: PrimaryColor,
              size: 25,
            ),
          ),
          if (num != 0)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: width * 0.05,
                width: width * 0.05,
                child: Text(
                  "${num}",
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor)),
              ),
            )
        ],
      ),
    );
  }
}
