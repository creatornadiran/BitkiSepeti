import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key? key,
      required this.text,
      required this.press,
      this.buttonWidth = 120,
      this.textFontSize = 20})
      : super(key: key);
  double textFontSize;
  double buttonWidth;
  final String? text;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: buttonWidth, vertical: 10),
        primary: Colors.white,
        textStyle: TextStyle(fontSize: textFontSize),
        backgroundColor: SecondaryColor1,
      ),
      onPressed: press as void Function()?,
      child: Text(
        text!,
        style: TextStyle(color: TextColor),
      ),
    );
  }
}
